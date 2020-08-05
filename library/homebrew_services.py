#!/usr/bin/python
from __future__ import absolute_import, division, print_function

import os

from ansible.module_utils.basic import AnsibleModule

__metaclass__ = type


def get_service(module, name):
    """Get details for brew service

   :return: str formatted: `Name  Status  User Plist`
    """
    rc, out, err = module.run_command(['brew', 'services', 'list'])
    if rc != 0 or err:
        module.fail_json(
            msg='Error listing installed brew services [%s]: %s' % (name,
                                                                    out + err))

    match = next((
        x for x in out.splitlines()
        if x.startswith(name)
    ), None)
    return match


def is_service_available(module, name):
    return get_service(module, name) is not None


def get_service_status(module, name):
    service = get_service(module, name)
    return service.split()[1]


def set_service_status(module, name, state):
    rc, out, err = module.run_command(['brew', 'services', state, name])
    if rc != 0 or err:
        module.fail_json(
            msg='Error %sing service [%s]: (%d) %s' % (state,
                                                       name,
                                                       rc,
                                                       out + err))



def brew_services(module, name, state):
    if not is_service_available(module, name):
        module.fail_json(msg='Service [%s] is not available' % (name))

    before_status = get_service_status(module, name)
    if before_status.lower() == state.lower():
        changed = False
        return changed

    if state == 'started':
        set_service_status(module, name, 'start')
    elif state == 'stopped':
        set_service_status(module, name, 'stop')
    elif state == 'restarted':
        set_service_status(module, name, 'restart')

    after_status = get_service_status(module, name)
    changed = before_status != after_status or state == 'restarted'
    return changed


def run_module():
    module_args = dict(
        name=dict(type='str', required=True),
        state=dict(type='str', required=True))

    module = AnsibleModule(argument_spec=module_args,
                           supports_check_mode=False)

    name = module.params['name']
    state = module.params['state']

    changed = brew_services(module, name, state)

    if changed:
        msg = '%s is now %s' % (name, state)
    else:
        msg = '%s is already %s' % (name, state)

    module.exit_json(changed=changed, msg=msg)


def main():
    run_module()


if __name__ == '__main__':
    main()
