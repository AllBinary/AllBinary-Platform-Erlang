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
% package admin.taghelpers
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('SpecialItemsHelperFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TagHelperFactoryInterface

static_init() ->
    put({?MODULE, 'CLASSNAME'}, "admin.taghelpers.SpecialItemsHelper"),
    put({?MODULE, 'FACTORYNAME'}, "SpecialItemsHelperFactory"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getInstance(This, HashMap, PageContext) ->
        'HelperFactory':getInstance(get({'SpecialItemsHelperFactory', 'FACTORYNAME'}), get({'SpecialItemsHelperFactory', 'CLASSNAME'}), HashMap, PageContext).

