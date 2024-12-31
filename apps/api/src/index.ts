import { defineAbilityFor, projectSchema } from '@rbac/auth'

const ability = defineAbilityFor({ role: 'MEMBER', id: '1' })

const project = projectSchema.parse({
  id: '1',
  ownerId: '2',
})

console.log(ability.can('get', 'User'))
console.log(ability.can('get', 'Billing'))
console.log(ability.can('delete', 'Project'))
console.log(ability.can('delete', project))
