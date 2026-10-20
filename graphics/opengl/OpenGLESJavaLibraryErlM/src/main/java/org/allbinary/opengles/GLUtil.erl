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
% package org.allbinary.opengles
% import java.nio.Buffer
% import java.nio.ByteBuffer
% import java.nio.ByteOrder
% import java.nio.FloatBuffer

-module('GLUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GLUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'BYTES_PER_FLOAT'}, 4),
    put({This, 'NULL_FLOAT_BUFFER'}, (fun(Target_N65823) -> (get({Target_N65823, '$class'})):asFloatBuffer(Target_N65823) end)('ByteBuffer':allocateDirect(0))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GLUtil', instance}).

makeFloatBuffer3(This, P_a, P_b, P_c) when is_number(P_a), is_number(P_b), is_number(P_c) ->
        B = 'ByteBuffer':allocateDirect((3 * get({This, 'BYTES_PER_FLOAT'}))),
        (get({B, '$class'})):order(B, 'ByteOrder':nativeOrder()),
        Buffer = (get({B, '$class'})):asFloatBuffer(B),
        (get({Buffer, '$class'})):put(Buffer, P_a),
        (get({Buffer, '$class'})):put(Buffer, P_b),
        (get({Buffer, '$class'})):put(Buffer, P_c),
        (get({This, '$class'})):position(This, Buffer, 0),
        Buffer.

makeFloatBuffer4(This, P_a, P_b, P_c, P_d) when is_number(P_a), is_number(P_b), is_number(P_c), is_number(P_d) ->
        B = 'ByteBuffer':allocateDirect((4 * get({This, 'BYTES_PER_FLOAT'}))),
        (get({B, '$class'})):order(B, 'ByteOrder':nativeOrder()),
        Buffer = (get({B, '$class'})):asFloatBuffer(B),
        (get({Buffer, '$class'})):put(Buffer, P_a),
        (get({Buffer, '$class'})):put(Buffer, P_b),
        (get({Buffer, '$class'})):put(Buffer, P_c),
        (get({Buffer, '$class'})):put(Buffer, P_d),
        (get({This, '$class'})):position(This, Buffer, 0),
        Buffer.

makeFloatBuffer(This, ByteBuffer) ->
        B = 'ByteBuffer':allocateDirect(((get({ByteBuffer, '$class'})):limit(ByteBuffer) * get({This, 'BYTES_PER_FLOAT'}))),
        (get({B, '$class'})):order(B, 'ByteOrder':nativeOrder()),
        Buffer = (get({B, '$class'})):asFloatBuffer(B),
        put({local, unsigned}, 0),
        put({local, v}, 0.0),
        (fun Loop() -> case (get({ByteBuffer, '$class'})):hasRemaining(ByteBuffer) of true ->
            put({local, unsigned}, ((trunc((get({ByteBuffer, '$class'})):get(ByteBuffer))) band 16#FF)),
            put({local, v}, ((float(get({local, unsigned}))) / 255.0)),
            (get({Buffer, '$class'})):put(Buffer, get({local, v})),
            Loop();
        false -> ok end end)(),
        (get({This, '$class'})):position(This, Buffer, 0),
        Buffer.

position(This, Buffer, NewPosition) when is_integer(NewPosition) ->
        (get({Buffer, '$class'})):position(Buffer, NewPosition).

rotateUVs(This, Uvs, AngleDegrees, PivotU, PivotV) when (is_tuple(Uvs) orelse Uvs =:= undefined), is_number(AngleDegrees), is_number(PivotU), is_number(PivotV) ->
        AngleRad = ((AngleDegrees) * math:pi() / 180),
        CosA = math:cos(AngleRad),
        SinA = math:sin(AngleRad),
        lists:foreach(fun(I) ->
            U = array:get(I, Uvs),
            V = array:get((I + 1), Uvs),
            Du = (U - PivotU),
            Dv = (V - PivotV),
            Ru = ((((Du * CosA) - (Dv * SinA))) + PivotU),
            Rv = ((((Du * SinA) + (Dv * CosA))) + PivotV),
            array:set(I, Ru, Uvs),
            array:set((I + 1), Rv, Uvs)
        end, lists:seq(0, array:size(Uvs) - 1, 2)).

