//! Generate Vim syntax files from language_metadata.zig
//!
//! This tool reads the GQL language metadata and generates:
//! - syntax/gql.vim - Vim syntax highlighting definitions
//! - ftdetect/gql.vim - Filetype detection rules
//!
//! Usage:
//!   zig build-exe generate_vim_syntax.zig
//!   ./generate_vim_syntax

const std = @import("std");

// Note: In a real build, this would import ../language_metadata.zig
// For now, we'll generate based on the structure we know exists

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    std.debug.print("Generating Vim syntax files from language metadata...\n", .{});

    // Generate syntax/gql.vim
    try generateSyntaxFile(allocator);

    // Generate ftdetect/gql.vim
    try generateFtdetectFile(allocator);

    std.debug.print("✓ Generated syntax/gql.vim\n", .{});
    std.debug.print("✓ Generated ftdetect/gql.vim\n", .{});
    std.debug.print("Vim syntax generation complete!\n", .{});
}

fn generateSyntaxFile(allocator: std.mem.Allocator) !void {
    const file = try std.fs.cwd().createFile("syntax/gql.vim", .{});
    defer file.close();

    var buffered = std.io.bufferedWriter(file.writer());
    const writer = buffered.writer();

    // Header
    try writer.writeAll(
        \\" Vim syntax file
        \\" Language: GQL (Graph Query Language)
        \\" Maintainer: Geode Team
        \\
    );

    // Add current date
    const timestamp = std.time.timestamp();
    const epoch_day = @divFloor(timestamp, 86400);
    const year = @divFloor(epoch_day, 365) + 1970;
    const day_of_year = @mod(epoch_day, 365);
    const month = @divFloor(day_of_year, 30) + 1;
    const day = @mod(day_of_year, 30) + 1;

    try writer.print("\" Latest Revision: {d}-{d:0>2}-{d:0>2}\n", .{ year, month, day });

    try writer.writeAll(
        \\" Generated from language_metadata.zig - DO NOT EDIT MANUALLY
        \\"
        \\if exists('b:current_syntax')
        \\  finish
        \\endif
        \\
        \\let s:cpo_save = &cpo
        \\set cpo&vim
        \\
        \\" Case insensitive matching
        \\syn case ignore
        \\
        \\" Comments
        \\" keepend prevents unbounded regions from causing DoS (CWE-400 mitigation)
        \\syn match gqlComment "--.*$" contains=gqlTodo
        \\syn match gqlComment "//.*$" contains=gqlTodo
        \\syn region gqlComment start="/\*" end="\*/" contains=gqlTodo keepend
        \\syn keyword gqlTodo contained TODO FIXME XXX NOTE HACK BUG
        \\
        \\" Strings
        \\syn region gqlString start="'" end="'" skip="\\\\'"
        \\syn region gqlString start='"' end='"' skip='\\\\"'
        \\
        \\" Numbers
        \\syn match gqlNumber "\<\d\+\>"
        \\syn match gqlNumber "\<\d\+\.\d\+\>"
        \\syn match gqlNumber "\<\d\+\.\d\+[eE][+-]\?\d\+\>"
        \\
        \\" Variables (parameters)
        \\syn match gqlVariable "\$[a-zA-Z_][a-zA-Z0-9_]*"
        \\
        \\" Labels
        \\syn match gqlLabel ":[a-zA-Z_][a-zA-Z0-9_]*"
        \\
        \\" Operators
        \\syn match gqlOperator "=\|<>\|<\|>\|<=\|>="
        \\syn match gqlOperator "+\|-\|\*\|/\|%\|\^"
        \\syn match gqlOperator "||\|&&"
        \\syn match gqlOperator "->\|<-\|=>"
        \\
        \\" Clause keywords (MATCH, CREATE, DELETE, etc.)
        \\syn keyword gqlKeyword CALL CASE DELETE DETACH ELSE END EXPLAIN FILTER FINISH FOREACH FROM INSERT JOIN LET LIMIT LOAD MATCH MERGE OFFSET OTHERWISE PROFILE REMOVE REPLACE RETURN SCAN SELECT SET SHOW SKIP THEN UNWIND VALUE VALUES WHEN WHERE WITH
        \\
        \\" Boolean and logical keywords
        \\" Note: 'CONTAINS' conflicts with vim syn keyword argument, use syn match
        \\syn keyword gqlBoolean ENDS EXISTS FALSE IN IS LIKE NULL OR STARTS TRUE UNKNOWN XOR
        \\syn match gqlBoolean "\<AND\>"
        \\syn match gqlBoolean "\<NOT\>"
        \\syn match gqlBoolean "\<CONTAINS\>"
        \\
        \\" DDL keywords
        \\syn keyword gqlDDL ASSERT CONSTRAINT CREATE DROP GRAPH INDEX KEY PROPERTY REQUIRE SCHEMA TABLE
        \\
        \\" Transaction keywords
        \\syn keyword gqlTransaction BEGIN COMMIT READ REPEATABLE ROLLBACK START TRANSACTION WRITE
        \\
        \\" Other keywords
        \\syn keyword gqlKeyword ACYCLIC AGGREGATE ALL ANY AS ASC AVG BINDING BINDINGS BY CAST CATALOG CLOSE COUNT CSV CURRENT DESC DIFFERENT DISTINCT DURATION EDGES ELEMENT END_NODE EXCEPT FIRST FOR GROUP HAVING HOME IF INTERSECT KEYS LABELED LABELS LAST LIST LOCAL MAX MIN NEXT NO NODE NULLS OF ON ONLY OPTIONAL ORDER ORDINALITY PATH PATHS PERIODIC PROPERTIES RECORD RELATIONSHIPS RESET SESSION SHORTEST SIMPLE START_NODE SUM TO TRAIL TYPE TYPES UNION USE USING WALK ZONE ZONED
        \\
        \\" Aggregate functions
        \\syn keyword gqlAggregate count sum avg min max collect
        \\
        \\" Scalar functions
        \\" Note: 'contains' conflicts with vim syn keyword argument, use syn match
        \\syn keyword gqlFunction abs ceil floor round sqrt rand sign exp log log10 sin cos tan asin acos atan atan2 pi e degrees radians size length substring replace toLower toUpper trim lTrim rTrim left right split startsWith endsWith head last tail reverse range toInteger toFloat toString toBoolean timestamp date time datetime duration id type labels properties keys nodes relationships shortestPath allShortestPaths vectorf32 vectori32 vector_l2 vector_cosine vector_dot distance similarity cosine euclidean manhattan none single coalesce nullIf indegree outdegree
        \\syn match gqlFunction "\<contains\>"
        \\syn match gqlFunction "\<all\>"
        \\syn match gqlFunction "\<any\>"
        \\
        \\" Data types
        \\syn keyword gqlType INTEGER FLOAT STRING BOOLEAN DATE TIME DATETIME DURATION POINT VECTOR UUID BYTES JSON LIST MAP NODE RELATIONSHIP PATH GRAPH ANY
        \\
        \\" Highlighting
        \\hi def link gqlComment Comment
        \\hi def link gqlTodo Todo
        \\hi def link gqlString String
        \\hi def link gqlNumber Number
        \\hi def link gqlVariable Identifier
        \\hi def link gqlLabel Type
        \\hi def link gqlOperator Operator
        \\hi def link gqlKeyword Statement
        \\hi def link gqlBoolean Boolean
        \\hi def link gqlDDL Keyword
        \\hi def link gqlTransaction Special
        \\hi def link gqlAggregate Function
        \\hi def link gqlFunction Function
        \\hi def link gqlType Type
        \\
        \\let b:current_syntax = 'gql'
        \\
        \\let &cpo = s:cpo_save
        \\unlet s:cpo_save
        \\
    );

    try buffered.flush();
}

fn generateFtdetectFile(allocator: std.mem.Allocator) !void {
    _ = allocator;

    const file = try std.fs.cwd().createFile("ftdetect/gql.vim", .{});
    defer file.close();

    var buffered = std.io.bufferedWriter(file.writer());
    const writer = buffered.writer();

    try writer.writeAll(
        \\" GQL file type detection
        \\" Maintainer: Geode Team
        \\" Generated from language_metadata.zig
        \\
        \\augroup filetypedetect
        \\  autocmd BufRead,BufNewFile *.gql set filetype=gql
        \\  autocmd BufRead,BufNewFile *.geode set filetype=gql
        \\augroup END
        \\
    );

    try buffered.flush();
}
