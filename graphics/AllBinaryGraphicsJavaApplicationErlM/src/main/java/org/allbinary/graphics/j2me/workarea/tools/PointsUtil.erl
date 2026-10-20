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
% package org.allbinary.graphics.j2me.workarea.tools
% import org.allbinary.animation.VectorRotationGenerator
% import org.allbinary.graphics.GPoint
% import org.allbinary.math.AngleFactory
% import org.allbinary.util.BasicArrayList

-module('PointsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PointsUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PointsUtil', instance}).

% throws Exception
doTransforms(This, PointVector, Angle, FulcrumPoint) ->
        (fun(Target_N65816) -> (get({Target_N65816, '$class'})):getListAtAngle(Target_N65816, (get({FulcrumPoint, '$class'})):getX(FulcrumPoint), (get({FulcrumPoint, '$class'})):getY(FulcrumPoint), PointVector, (fun(Target_N65881) -> (get({Target_N65881, '$class'})):getAt(Target_N65881, (get({Angle, '$class'})):intValue(Angle)) end)('AngleFactory':getInstance())) end)('VectorRotationGenerator':getInstance()).

