# importing-node-modules

### Usando módulo do node com typescript

1. Adicionar a dependencia de desenvolvimento `@types/node`
    ```bash
    yarn add @types/node --dev
    ```

2. Configurar a propriedade `typeRoots` de `tsconfig.json` da seguinte forma:

    ```json
    "typeRoots": [
      "./node_modules/@types"
    ]
    ```

3. Se estiver tentando utilizar um módulo do Node, certifique-se que o `target` de seu webpack está definido para `node`

    ```js
    module.exports {
      // ...
      target: 'node'
    }
    ```