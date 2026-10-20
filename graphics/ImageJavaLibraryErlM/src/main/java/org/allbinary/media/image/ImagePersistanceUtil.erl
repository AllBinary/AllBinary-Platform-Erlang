% 
% To change this license header, choose License Headers in Project Properties. 
% To change this template file, choose Tools | Templates 
% and open the template in the editor.  
% Generated Code Do Not Modify
% package org.allbinary.media.image
% import java.awt.image.BufferedImage
% import java.io.File
% import java.io.IOException
% import java.util.Iterator
% import javax.imageio.IIOImage
% import javax.imageio.ImageIO
% import javax.imageio.ImageWriteParam
% import javax.imageio.ImageWriter
% import javax.imageio.stream.ImageOutputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbFileOutputStream
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.string.CommonStrings
% import org.apache.batik.ext.awt.image.codec.png.PNGImageWriter

-module('ImagePersistanceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImagePersistanceUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ImagePersistanceUtil', instance}).

% throws Exception
saveWithBatik(This, File, BufferedImage) ->
        BatikPNGImageWriter = 'PNGImageWriter':new(),
        FileOutputStream = 'AbFileOutputStream':createFromAbFile(File),
        try
            (get({BatikPNGImageWriter, '$class'})):writeImage(BatikPNGImageWriter, BufferedImage, FileOutputStream)
        after
            (get({FileOutputStream, '$class'})):flush(FileOutputStream),
            (fun(Target_N66332) -> (get({Target_N66332, '$class'})):close(Target_N66332, FileOutputStream) end)('StreamUtil':getInstance())
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Wrote Image: ", (get({File, '$class'})):getAbsolutePath(File)]), This, get({get({This, commonStrings}), 'SAVE'})).

saveWithImageIO(This, FilePath, BufferedImage) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        (get({This, '$class'})):saveWithImageIO(This, 'File':new(FilePath), BufferedImage);
saveWithImageIO(This, File, BufferedImage) ->
        try
        put({local, writer}, undefined),
        put({local, ios}, undefined),
        try
            Iter = 'ImageIO':getImageWritersByFormatName("jpeg"),
            case (not (get({Iter, '$class'})):hasNext(Iter)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Unable to save image to jpeg file type.", This, get({get({This, commonStrings}), 'SAVE'})),
                throw({'$return', ok});
                false -> ok
            end,
            put({local, writer}, (get({Iter, '$class'})):next(Iter)),
            put({local, ios}, 'ImageIO':createImageOutputStream(File)),
            (get({get({local, writer}), '$class'})):setOutput(get({local, writer}), get({local, ios})),
            Iwp = (get({get({local, writer}), '$class'})):getDefaultWriteParam(get({local, writer})),
            (get({Iwp, '$class'})):setCompressionMode(Iwp, get({'ImageWriteParam', 'MODE_EXPLICIT'})),
            (get({Iwp, '$class'})):setCompressionQuality(Iwp, 0.95),
            (get({get({local, writer}), '$class'})):write(get({local, writer}), undefined, 'IIOImage':new(BufferedImage, undefined, undefined), Iwp),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Wrote Image: ", (get({File, '$class'})):getAbsolutePath(File)]), This, get({get({This, commonStrings}), 'SAVE'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'SAVE'}), E)
        after
            try
                case (get({local, ios}) =/= undefined) of
                    true ->
                    (get({get({local, ios}), '$class'})):flush(get({local, ios})),
                    try
                        case (get({local, ios}) =/= undefined) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, ios}), '$class'})):toString(get({local, ios})), get({local, ios}), get({get({This, commonStrings}), 'CLOSE'})),
                            (get({get({local, ios}), '$class'})):close(get({local, ios}));
                            false -> ok
                        end
                    catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                        (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), get({local, ios}), get({get({This, commonStrings}), 'CLOSE'}), E)
                    end;
                    false -> ok
                end,
                case (get({local, writer}) =/= undefined) of
                    true ->
                    (get({get({local, writer}), '$class'})):dispose(get({local, writer}));
                    false -> ok
                end
            catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'SAVE'}), E2)
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.


