import { ability } from '@rbac/auth'

const userCanInviteSomeone = ability.can('invite', 'User')

console.log(userCanInviteSomeone)
