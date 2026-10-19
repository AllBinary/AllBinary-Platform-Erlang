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
% package org.allbinary.media.image.comparison
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('ImageComparisonResultsEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, imageComparisonResult}, undefined),
    ok.


new(AnyType, ImageComparisonInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType, ImageComparisonInfo),
    This.

init(This, AnyType, ImageComparisonInfo) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This),
        (get({This, '$class'})):setImageComparisonResult(This, ImageComparisonInfo).

getImageComparisonResult(This) ->
        get({This, imageComparisonResult}).

setImageComparisonResult(This, ImageComparisonResult) ->
        put({This, imageComparisonResult}, ImageComparisonResult).

