/** @type {import('eslint').Linter.Config} */

module.exports = {
  extends: [
    '@rockset/eslint-config/react',
  ],
  plugins: ['simple-import-sort'],
  rules: {
    'simple-import-sort/imports': 'error',
  }
}