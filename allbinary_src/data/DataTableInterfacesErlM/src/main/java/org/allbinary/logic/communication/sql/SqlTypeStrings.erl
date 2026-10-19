% Generated Code Do Not Modify
% package org.allbinary.logic.communication.sql
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('SqlTypeStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SqlTypeStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'CHAR_COLUMN'}, "VARCHAR"),
    put({This, 'INT_COLUMN'}, "VARCHAR"),
    put({This, 'MAX_SIZE'}, "(255)"),
    put({This, 'SIXTY_SIZE'}, "(60)"),
    put({This, 'NOT_NULL'}, "NOT NULL"),
    put({This, 'ONE_SIZE'}, "(1)"),
    put({This, 'TWO_SIZE'}, "(2)"),
    put({This, 'THREE_SIZE'}, "(3)"),
    put({This, 'SIX_SIZE'}, "(6)"),
    put({This, 'ELEVEN_SIZE'}, "(11)"),
    put({This, 'TWELVE_SIZE'}, "(12)"),
    put({This, 'ONE_KB_CHAR_COLUMN'}, (fun(Target_N66188) -> (get({Target_N66188, '$class'})):toString(Target_N66188) end)((fun(Target_N66195) -> (get({Target_N66195, '$class'})):append(Target_N66195, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N66202) -> (get({Target_N66202, '$class'})):append(Target_N66202, "(1024)") end)((fun(Target_N66209) -> (get({Target_N66209, '$class'})):append(Target_N66209, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N66216) -> (get({Target_N66216, '$class'})):append(Target_N66216, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new())))))),
    put({This, 'MAX_CHAR_COLUMN'}, (fun(Target_N66346) -> (get({Target_N66346, '$class'})):toString(Target_N66346) end)((fun(Target_N66353) -> (get({Target_N66353, '$class'})):append(Target_N66353, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N66360) -> (get({Target_N66360, '$class'})):append(Target_N66360, get({This, 'MAX_SIZE'})) end)((fun(Target_N66367) -> (get({Target_N66367, '$class'})):append(Target_N66367, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N66374) -> (get({Target_N66374, '$class'})):append(Target_N66374, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new())))))),
    put({This, 'MAX_CHAR_COLUMN_NOT_NULL'}, (fun(Target_N66508) -> (get({Target_N66508, '$class'})):toString(Target_N66508) end)((fun(Target_N66515) -> (get({Target_N66515, '$class'})):append(Target_N66515, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N66522) -> (get({Target_N66522, '$class'})):append(Target_N66522, get({This, 'NOT_NULL'})) end)((fun(Target_N66529) -> (get({Target_N66529, '$class'})):append(Target_N66529, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N66536) -> (get({Target_N66536, '$class'})):append(Target_N66536, get({This, 'MAX_SIZE'})) end)((fun(Target_N66543) -> (get({Target_N66543, '$class'})):append(Target_N66543, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N66550) -> (get({Target_N66550, '$class'})):append(Target_N66550, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new())))))))),
    put({This, 'SIXTY_CHAR_COLUMN_NOT_NULL'}, (fun(Target_N66724) -> (get({Target_N66724, '$class'})):toString(Target_N66724) end)((fun(Target_N66731) -> (get({Target_N66731, '$class'})):append(Target_N66731, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N66738) -> (get({Target_N66738, '$class'})):append(Target_N66738, get({This, 'NOT_NULL'})) end)((fun(Target_N66745) -> (get({Target_N66745, '$class'})):append(Target_N66745, get({This, 'SIXTY_SIZE'})) end)((fun(Target_N66752) -> (get({Target_N66752, '$class'})):append(Target_N66752, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N66759) -> (get({Target_N66759, '$class'})):append(Target_N66759, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new()))))))),
    put({This, 'ONE_CHAR_COLUMN_NOT_NULL'}, (fun(Target_N66905) -> (get({Target_N66905, '$class'})):toString(Target_N66905) end)((fun(Target_N66912) -> (get({Target_N66912, '$class'})):append(Target_N66912, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N66919) -> (get({Target_N66919, '$class'})):append(Target_N66919, get({This, 'NOT_NULL'})) end)((fun(Target_N66926) -> (get({Target_N66926, '$class'})):append(Target_N66926, get({This, 'ONE_SIZE'})) end)((fun(Target_N66933) -> (get({Target_N66933, '$class'})):append(Target_N66933, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N66940) -> (get({Target_N66940, '$class'})):append(Target_N66940, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new()))))))),
    put({This, 'SIX_CHAR_COLUMN_NOT_NULL'}, (fun(Target_N67086) -> (get({Target_N67086, '$class'})):toString(Target_N67086) end)((fun(Target_N67093) -> (get({Target_N67093, '$class'})):append(Target_N67093, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N67100) -> (get({Target_N67100, '$class'})):append(Target_N67100, get({This, 'NOT_NULL'})) end)((fun(Target_N67107) -> (get({Target_N67107, '$class'})):append(Target_N67107, get({This, 'SIX_SIZE'})) end)((fun(Target_N67114) -> (get({Target_N67114, '$class'})):append(Target_N67114, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N67121) -> (get({Target_N67121, '$class'})):append(Target_N67121, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new()))))))),
    put({This, 'TWELVE_CHAR_COLUMN_NOT_NULL'}, (fun(Target_N67267) -> (get({Target_N67267, '$class'})):toString(Target_N67267) end)((fun(Target_N67274) -> (get({Target_N67274, '$class'})):append(Target_N67274, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N67281) -> (get({Target_N67281, '$class'})):append(Target_N67281, get({This, 'NOT_NULL'})) end)((fun(Target_N67288) -> (get({Target_N67288, '$class'})):append(Target_N67288, get({This, 'TWELVE_SIZE'})) end)((fun(Target_N67295) -> (get({Target_N67295, '$class'})):append(Target_N67295, get({This, 'CHAR_COLUMN'})) end)((fun(Target_N67302) -> (get({Target_N67302, '$class'})):append(Target_N67302, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new()))))))),
    put({This, 'TWO_INT_NOT_NULL'}, " INT(2) NOT NULL, "),
    put({This, 'THREE_INT_NOT_NULL'}, " INT(3) NOT NULL, "),
    put({This, 'FOUR_INT_NOT_NULL'}, " INT(4) NOT NULL, "),
    put({This, 'MAX_INT_NOT_NULL'}, " INT(11) NOT NULL, "),
    put({This, 'MAX_INT_UNSIGNED'}, " INT(11) UNSIGNED, "),
    put({This, 'MAX_INT_UNSIGNED_NOT_NULL'}, " INT(11) UNSIGNED NOT NULL, "),
    put({This, 'MAX_BIG_INT_NOT_NULL'}, " BIGINT(19) NOT NULL, "),
    put({This, 'MAX_BIG_INT_UNSIGNED'}, " BIGINT(19) UNSIGNED, "),
    put({This, 'MAX_BIG_INT_UNSIGNED_NOT_NULL'}, " BIGINT(19) UNSIGNED NOT NULL, "),
    put({This, 'MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL'}, " BIGINT(19) UNSIGNED AUTO_INCREMENT NOT NULL,"),
    put({This, 'LONG_BLOB'}, " LONGBLOB, "),
    put({This, 'BLOB'}, " BLOB, "),
    put({This, 'BLOB_NOT_NULL'}, " BLOB NOT NULL, "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'SqlTypeStrings', instance}).

