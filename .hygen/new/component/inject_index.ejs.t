---
to: src/common/components/index.ts
inject: true
skip_if: <%= name %>
append: true
---
export * from './<%= name %>';