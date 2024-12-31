import { defineAbilityFor } from '@rbac/auth'

const ability = defineAbilityFor({ role: 'MEMBER' })

const userCanManageEverything = ability.can('manage', 'all')
const userCanDeleteUsers = ability.can('delete', 'User')
const userCannotDeleteUsers = ability.cannot('delete', 'User')

console.log('loool', userCanManageEverything)
console.log('loool', userCanDeleteUsers)
console.log('loool', userCannotDeleteUsers)
