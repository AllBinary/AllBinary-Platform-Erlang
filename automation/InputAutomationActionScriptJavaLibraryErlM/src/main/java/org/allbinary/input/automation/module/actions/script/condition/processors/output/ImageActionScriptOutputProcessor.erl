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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.media.image.InputImageIOInterfaceFactory
% import org.allbinary.input.media.image.InputImageType
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.io.ImageIOInterface
% import org.allbinary.string.CommonStrings

-module('ImageActionScriptOutputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
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
process(ImageActionScriptOutputInterface, Frame) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, lists:concat(["Start - Processing at: ", (get({ImageActionScriptOutputInterface, '$class'})):toString(ImageActionScriptOutputInterface)]), "ImageActionScriptOutputProcessor", get({CommonStrings, 'PROCESS'})),
        ImageTypes = (get({ImageActionScriptOutputInterface, '$class'})):getImageTypes(ImageActionScriptOutputInterface),
        Vector = (get({ImageTypes, '$class'})):getVector(ImageTypes),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            ImageType = (get({Vector, '$class'})):get(Vector, Index),
            ImageIOInterface = 'InputImageIOInterfaceFactory':getInstance(ImageType),
            (get({ImageIOInterface, '$class'})):save(ImageIOInterface, Frame)
        end, lists:seq(0, Size - 1)).

