%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.globals
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.loader.WebappClassLoaderInfo
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('Globals').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'Globals':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'Globals', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This, ClassLoader, PathString) when (is_list(PathString) orelse PathString =:= undefined) ->
        CommonStrings = 'CommonStrings':getInstance(),
        AppUrlGlobals = 'AppUrlGlobals':new(),
        (get({AppUrlGlobals, '$class'})):setWebappPath(AppUrlGlobals, PathString),
        (get({get({'Globals', 'URLGLOBALS'}), '$class'})):init(get({'Globals', 'URLGLOBALS'}), AppUrlGlobals),
        'WebappClassLoaderInfo':setLoader(ClassLoader),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Setting Up AllBinary System Configuration Args: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, PathString),
        (get({StringBuffer, '$class'})):append(StringBuffer, " ClassLoader: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({ClassLoader, '$class'}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'INIT'})),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, PathString) of
            true ->
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "No Path Provided. Using Process Path: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, PathString),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'EQUALS'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'Globals', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'Globals', 'URLGLOBALS'}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'INIT'}));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Webapp Path Set To: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'Globals', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'Globals', 'URLGLOBALS'}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({CommonStrings, 'INIT'})).

