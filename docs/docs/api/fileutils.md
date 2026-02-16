---
sidebar_position: 10
---

# File Utilities

Helper functions for file I/O operations.

## file_exists

Checks whether a file exists on disk.

```fortran
logical :: exists
exists = file_exists(filepath)
```

| Parameter  | Intent | Type           | Description |
| ---------- | ------ | -------------- | ----------- |
| `filepath` | `in`   | `character(*)` | File path   |

**Returns:** `.true.` if the file exists. Prints a warning if not found.

## numRows

Counts the number of lines in an open file unit.

```fortran
integer :: nrows
nrows = numRows(fileunit)
```

| Parameter  | Intent | Type      | Description                                  |
| ---------- | ------ | --------- | -------------------------------------------- |
| `fileunit` | `in`   | `integer` | Fortran file unit number (file must be open) |

**Returns:** Number of lines. Rewinds the file unit after counting.

## countkeys

Counts bracket-delimited keys `[key]` in a header file.

```fortran
call countkeys(ifile, nkeys)
```

| Parameter | Intent | Type           | Description                                            |
| --------- | ------ | -------------- | ------------------------------------------------------ |
| `ifile`   | —      | `character(*)` | Path to the header file                                |
| `nkeys`   | —      | `integer`      | Counter (accumulated, must be initialized before call) |

## readheader

Parses a header file with `[attribute]` / `content` pairs.

```fortran
call readheader(hfile, attribute, content)
```

| Parameter   | Intent | Type                           | Description                        |
| ----------- | ------ | ------------------------------ | ---------------------------------- |
| `hfile`     | `in`   | `character(*)`                 | Header file path                   |
| `attribute` | `out`  | `character(*), allocatable(:)` | Attribute names (without brackets) |
| `content`   | `out`  | `character(*), allocatable(:)` | Content values                     |

### Header File Format

```
[attribute_name]
attribute_value

[another_attribute]
another_value
```
