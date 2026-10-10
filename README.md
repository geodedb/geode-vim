# Geode GQL Syntax Highlighting for Vim

Vim plugin providing syntax highlighting and filetype detection for Geode's GQL (Graph Query Language) and Cypher query files.

## Features

- **Syntax Highlighting**: Full support for GQL/Cypher keywords, functions, types, and operators
- **Filetype Detection**: Automatic detection for `.gql` and `.geode` files
- **Comment Support**: Highlighting for `--`, `//`, and `/* */` comments

## Supported Keywords

### Query Clauses

`MATCH`, `OPTIONAL`, `WHERE`, `RETURN`, `WITH`, `ORDER BY`, `SKIP`, `LIMIT`, `UNION`, `INTERSECT`, `EXCEPT`, `UNWIND`, `CALL`, `YIELD`

### Data Modification

`CREATE`, `MERGE`, `DELETE`, `DETACH DELETE`, `SET`, `REMOVE`, `INSERT`

### DDL

`CREATE GRAPH`, `DROP GRAPH`, `CREATE INDEX`, `DROP INDEX`, `CONSTRAINT`, `SCHEMA`

### Transactions

`BEGIN`, `COMMIT`, `ROLLBACK`, `TRANSACTION`

### Data Types

`INTEGER`, `FLOAT`, `STRING`, `BOOLEAN`, `DATE`, `TIME`, `DATETIME`, `DURATION`, `POINT`, `VECTOR`, `UUID`, `BYTES`, `JSON`, `LIST`, `MAP`

### Functions

- **Aggregation**: `count`, `sum`, `avg`, `min`, `max`, `collect`
- **Scalar**: `length`, `size`, `head`, `tail`, `last`, `reverse`, `range`
- **Math**: `abs`, `ceil`, `floor`, `round`, `sqrt`, `rand`, `exp`, `log`
- **String**: `toLower`, `toUpper`, `trim`, `substring`, `replace`, `split`
- **Vector** (Geode-specific): `vectorf32`, `vectori32`, `vector_l2`, `vector_cosine`, `distance`, `similarity`

## Installation

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'devnw/geode/geode-vim'
```

### Using [Vundle](https://github.com/VundleVim/Vundle.vim)

```vim
Plugin 'devnw/geode/geode-vim'
```

### Using Vim's Native Package Manager (Vim 8+)

```bash
mkdir -p ~/.vim/pack/geode/start
cd ~/.vim/pack/geode/start
git clone https://gitlab.com/devnw/geode/geode-vim.git
```

### Manual Installation

Copy the directories to your Vim configuration:

```bash
# Clone the repository
git clone https://gitlab.com/devnw/geode/geode-vim.git

# Copy to vim config
cp -r geode-vim/syntax ~/.vim/
cp -r geode-vim/ftdetect ~/.vim/
```

## Usage

Once installed, simply open a `.gql` or `.geode` file and syntax highlighting will be applied automatically.

To manually set the filetype:

```vim
:set filetype=gql
```

## File Extensions

| Extension | Filetype |
|-----------|----------|
| `.gql`    | gql      |
| `.geode`  | gql      |

## Plugin Structure

```text
geode-vim/
├── ftdetect/
│   └── gql.vim       # Filetype detection
├── syntax/
│   └── gql.vim       # Syntax highlighting rules
├── LICENSE
└── README.md
```

## Highlighting Groups

| Group | Description |
| ------- | ------------- |
| `gqlKeyword` | Query clauses and keywords |
| `gqlBoolean` | Boolean and logical operators |
| `gqlDDL` | Data definition keywords |
| `gqlTransaction` | Transaction keywords |
| `gqlAggregate` | Aggregation functions |
| `gqlFunction` | Scalar and built-in functions |
| `gqlType` | Data types |
| `gqlComment` | Comments |
| `gqlString` | String literals |
| `gqlNumber` | Numeric literals |
| `gqlVariable` | Parameter variables (`$name`) |
| `gqlLabel` | Node/relationship labels (`:Label`) |
| `gqlOperator` | Operators |

## Contributing

Contributions are welcome! Please submit issues and pull requests to the GitLab repository.

## Related Projects

- [geode-neovim](https://gitlab.com/devnw/geode/geode-neovim) - Neovim plugin with LSP support
- [Geode](https://gitlab.com/devnw/geode/geode) - The Geode graph database

## License

Apache License 2.0 - See [LICENSE](LICENSE) for details.
