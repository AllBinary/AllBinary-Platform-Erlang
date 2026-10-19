% Generated Code Do Not Modify
% package org.platform.opengl
% import javax.microedition.khronos.opengles.GL10

-module('OpenGLGLU').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLGLU':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLGLU', instance}).

gluLookAt(This, Gl, EyeX, EyeY, EyeZ, CenterX, CenterY, CenterZ, UpX, UpY, UpZ) when is_number(EyeX), is_number(EyeY), is_number(EyeZ), is_number(CenterX), is_number(CenterY), is_number(CenterZ), is_number(UpX), is_number(UpY), is_number(UpZ) ->
        erlang:error({'RuntimeException'}).

gluProject(This, Gl, ObjX, ObjY, ObjZ, Model, ModelOffset, Project, ProjectOffset, View, ViewOffset, Win, WinOffset) when is_number(ObjX), is_number(ObjY), is_number(ObjZ), (is_tuple(Model) orelse Model =:= undefined), is_integer(ModelOffset), (is_tuple(Project) orelse Project =:= undefined), is_integer(ProjectOffset), (is_tuple(View) orelse View =:= undefined), is_integer(ViewOffset), (is_tuple(Win) orelse Win =:= undefined), is_integer(WinOffset) ->
        erlang:error({'RuntimeException'}).

gluUnProject(This, Gl, WinX, WinY, WinZ, Model, ModelOffset, Project, ProjectOffset, View, ViewOffset, Obj, ObjOffset) when is_number(WinX), is_number(WinY), is_number(WinZ), (is_tuple(Model) orelse Model =:= undefined), is_integer(ModelOffset), (is_tuple(Project) orelse Project =:= undefined), is_integer(ProjectOffset), (is_tuple(View) orelse View =:= undefined), is_integer(ViewOffset), (is_tuple(Obj) orelse Obj =:= undefined), is_integer(ObjOffset) ->
        erlang:error({'RuntimeException'}).

glFrustumf(This, Gl, Lt, Rt, Btm, Top, ZNear, ZFar) when is_number(Lt), is_number(Rt), is_number(Btm), is_number(Top), is_number(ZNear), is_number(ZFar) ->
        erlang:error({'RuntimeException'}).

