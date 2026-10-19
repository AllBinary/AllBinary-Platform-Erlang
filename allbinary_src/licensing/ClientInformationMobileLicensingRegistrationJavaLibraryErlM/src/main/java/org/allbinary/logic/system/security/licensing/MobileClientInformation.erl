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
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('MobileClientInformation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbeClientInformation', Function, Arguments).

static_init() ->
    put({?MODULE, 'DESC'}, "Mobile"),
    put({?MODULE, 'ANDROID_DESC'}, lists:concat(["Android", get({'MobileClientInformation', 'DESC'})])),
    ok.

init_fields(This) ->
    ok.


new(Name, Version, SpecialName, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(SpecialName) orelse SpecialName =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Version, SpecialName, ShortName),
    This.

init(This, Name, Version, SpecialName, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(SpecialName) orelse SpecialName =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
        'AbeClientInformation':init(This, Name, Version, (fun(Target_N65889) -> (get({Target_N65889, '$class'})):toString(Target_N65889) end)((fun(Target_N65896) -> (get({Target_N65896, '$class'})):append(Target_N65896, (fun(Target_N65971) -> (get({Target_N65971, '$class'})):get(Target_N65971) end)('PartnerIdentifierFileUtil':getInstance())) end)((fun(Target_N65903) -> (get({Target_N65903, '$class'})):append(Target_N65903, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N65910) -> (get({Target_N65910, '$class'})):append(Target_N65910, SpecialName) end)('StringMaker':new())))), ShortName),
        String = (get({This, '$class'})):getSpecialName(This),
        Number = string:slice(String, (string:length(String) - 1)),
        case ('Integer':getInteger(Number) =:= undefined) of
            true ->
            (get({This, '$class'})):setHardSale(This, false);
            false -> ok
        end,
        CommonStrings = 'CommonStrings':getInstance(),
        case (get({This, '$class'})):isHardSale(This) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Use Hard Coded Selling", This, get({CommonStrings, 'CONSTRUCTOR'}));
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Don't Use Hard Coded Selling", This, get({CommonStrings, 'CONSTRUCTOR'}))
        end.

toHashtable(This) ->
        Hashtable = 'AbeClientInformation':toHashtable(This),
        RegistrationConfiguration = 'RegistrationConfiguration':getInstance(),
        (get({Hashtable, '$class'})):put(Hashtable, get({RegistrationConfiguration, 'NAME'}), (get({RegistrationConfiguration, '$class'})):getRegistrationCode(RegistrationConfiguration)),
        Hashtable.

