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
% package org.allbinary.input.media.image.capture
% import java.awt.Dimension
% import java.awt.Rectangle
% import java.awt.Toolkit
% import java.awt.image.BufferedImage
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('ScreenScavangerRobot').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getScreenAsBufferedImages(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getScreenAsBufferedImages"),
        DimScreenSize = (fun(Target_N66040) -> (get({Target_N66040, '$class'})):getScreenSize(Target_N66040) end)('Toolkit':getDefaultToolkit()),
        RectScreenSize = 'Rectangle':new(DimScreenSize),
        RobotHashtable = (fun(Target_N66155) -> (get({Target_N66155, '$class'})):get(Target_N66155) end)('InputRobotFactory':getInstance()),
        BufferedImageArray = array:new(1, {default, undefined}),
        Index = 0,
        InputRobotInterface = (get({RobotHashtable, '$class'})):get(RobotHashtable, "Java Robot"),
        array:set(Index, (get({InputRobotInterface, '$class'})):createScreenCapture(InputRobotInterface, RectScreenSize), BufferedImageArray),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Finish", This, "getScreenAsBufferedImages"),
        BufferedImageArray.

