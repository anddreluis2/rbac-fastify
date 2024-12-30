/** @type {import('eslint').Linter.Config} */

module.exports = {
  extends: [
    '@rockset/eslint-config/next',
  ],
  plugins: ['simple-import-sort'],
  rules: {
    'simple-import-sort/imports': 'error',
  }
}