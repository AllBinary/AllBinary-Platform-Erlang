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
% package org.allbinary.input.automation.module.generic.configuration.profile.actions.script
% import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel
% import org.allbinary.logic.communication.log.LogUtil

-module('RemoveActionScriptItemJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Panel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, genericProfileActionJPanel}, undefined),
    put({This, profileActionScriptConditionInterface}, undefined),
    put({This, removeJButton}, undefined),
    ok.


new(GenericProfileActionJPanel, ProfileActionScriptConditionInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GenericProfileActionJPanel, ProfileActionScriptConditionInterface),
    This.

init(This, GenericProfileActionJPanel, ProfileActionScriptConditionInterface) ->
    'Panel':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        put({This, genericProfileActionJPanel}, GenericProfileActionJPanel),
        put({This, profileActionScriptConditionInterface}, ProfileActionScriptConditionInterface).

initComponents(This) ->
        put({This, removeJButton}, 'JButton':new()),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new()),
        (get({get({This, removeJButton}), '$class'})):setText(get({This, removeJButton}), "Remove"),
        (get({get({This, removeJButton}), '$class'})):addActionListener(get({This, removeJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({This, '$class'})):add(This, get({This, removeJButton})).

removeJButtonActionPerformed(This, Evt) ->
        try
        GenericProfileAction = (get({get({This, genericProfileActionJPanel}), '$class'})):getGenericProfileAction(get({This, genericProfileActionJPanel})),
        case (GenericProfileAction =:= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "GenericProfileAction was null", This, "removeJButtonActionPerformed"),
            throw({'$return', ok});
            false -> ok
        end,
        (fun(Target_N66546) -> (get({Target_N66546, '$class'})):removeCondition(Target_N66546, get({This, profileActionScriptConditionInterface})) end)((get({GenericProfileAction, '$class'})):getGenericProfileActionScript(GenericProfileAction)),
        (get({get({This, genericProfileActionJPanel}), '$class'})):updateProfileActionUI(get({This, genericProfileActionJPanel}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

