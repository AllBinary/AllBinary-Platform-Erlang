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
% package org.allbinary.input.automation
% import org.allbinary.thread.ARunnable
% import java.net.URI
% import java.net.URL
% import java.awt.Desktop
% import java.util.List
% import javax.swing.ImageIcon
% import javax.swing.JDialog
% import javax.help.HelpSet
% import javax.help.event.HelpSetEvent
% import javax.help.event.HelpSetListener
% import bundle.input.automation.InputAutomationBundleActivatorListenerInterface
% import bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener
% import bundle.input.automation.robot.InputAutomationRobotChangeListener
% import org.allbinary.globals.AppUrlGlobals
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.gui.dialog.BasicTextJDialog
% import org.allbinary.gui.swing.workers.JListSwingWorker
% import org.allbinary.input.automation.configuration.InputAutomationConfiguration
% import org.allbinary.input.automation.configuration.InputAutomationConfigurationFactory
% import org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryFactory
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations
% import org.allbinary.input.automation.osgi.DesktopBundle
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.java.help.JavaHelpUtil
% import org.allbinary.logic.system.loader.WebappClassLoaderInfo
% import org.allbinary.logic.system.security.licensing.InputAutomationClientInformationFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.RunnableInterface

-module('InputAutomationJFrame').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements InputAutomationConfigurationModuleChangeListener
% implements InputAutomationRobotChangeListener
% implements HelpSetListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('JFrame', Function, Arguments).

static_init() ->
    put({?MODULE, 'INPUTAUTOMATION_JFRAME'}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, inputAutomationModuleConfigurations}, 'InputAutomationModuleConfigurations':new()),
    put({This, inputAutomationModuleFactory}, undefined),
    put({This, inputAutomationModuleInterface}, undefined),
    put({This, runnableInterface}, undefined),
    put({This, thread}, undefined),
    put({This, helpSet}, undefined),
    put({This, uri}, 'URI':new("http://geocities.com/allbinary/")),
    put({This, aboutJMenuItem}, undefined),
    put({This, automationModuleConfigurationJPanel}, undefined),
    put({This, gameRobotJTabbedPane}, undefined),
    put({This, helpJMenuItem}, undefined),
    put({This, inputAutomationModuleJList}, undefined),
    put({This, inputAutomationModuleJPanel}, undefined),
    put({This, jScrollPane1}, undefined),
    put({This, mainJMenuBar}, undefined),
    put({This, modulesJMenuItem}, undefined),
    put({This, noModuleSelectedJDialog}, undefined),
    put({This, noModuleSelectedJLabel}, undefined),
    put({This, optionsJMenu}, undefined),
    put({This, processingJMenu}, undefined),
    put({This, startJMenuItem}, undefined),
    put({This, stopJMenuItem}, undefined),
    put({This, stopOnFocusJCheckBoxMenuItem}, undefined),
    put({This, subscriptionJMenuItem}, undefined),
    put({This, toolsJMenu}, undefined),
    put({This, updatesJMenuItem}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'JFrame':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        put({local, url}, (get({get({This, '$class'}), '$class'})):getResource(get({This, '$class'}), "/help/Help.hs")),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["URL: ", get({local, url})]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, helpSet}, (fun(Target_N67170) -> (get({Target_N67170, '$class'})):getHelpSet(Target_N67170, get({local, url})) end)('JavaHelpUtil':getInstance())),
        put({local, url}, (get({get({This, '$class'}), '$class'})):getResource(get({This, '$class'}), "/resources/allbinaryicon8bit.jpg")),
        ImageIcon = 'ImageIcon':new(get({local, url})),
        (get({This, '$class'})):setIconImage(This, (get({ImageIcon, '$class'})):getImage(ImageIcon)),
        (get({This, '$class'})):init(This).

helpSetAdded(This, HelpSetEvent) ->
        (get({get({This, helpSet}), '$class'})):add(get({This, helpSet}), (get({HelpSetEvent, '$class'})):getHelpSet(HelpSetEvent)).

helpSetRemoved(This, HelpSetEvent) ->
        (get({get({This, helpSet}), '$class'})):remove(get({This, helpSet}), (get({HelpSetEvent, '$class'})):getHelpSet(HelpSetEvent)).

% throws Exception
init(This) ->
        InputAutomationConfigurationFactory = 'InputAutomationConfigurationFactory':getInstance(),
        (get({InputAutomationConfigurationFactory, '$class'})):init(InputAutomationConfigurationFactory, 'InputAutomationClientInformationFactory':getInstance()),
        InputAutomationModuleConfigurationList = (get({get({InputAutomationConfigurationFactory, inputAutomationConfiguration}), '$class'})):getInputAutomationModuleConfigurationList(get({InputAutomationConfigurationFactory, inputAutomationConfiguration})),
        case (InputAutomationModuleConfigurationList =:= undefined) of
            true ->
            ok;
            false ->
            put({This, inputAutomationModuleConfigurations}, 'InputAutomationModuleConfigurations':new(InputAutomationModuleConfigurationList))
        end,
        put({This, inputAutomationModuleFactory}, 'InputAutomationModuleFactoryFactory':new(get({This, inputAutomationModuleConfigurations}), This)),
        (fun(Target_N67857) -> (get({Target_N67857, '$class'})):execute(Target_N67857) end)(('JListSwingWorker':new(get({This, inputAutomationModuleJList}), (get({get({This, inputAutomationModuleFactory}), '$class'})):getListModel(get({This, inputAutomationModuleFactory}))))),
        (get({get({This, gameRobotJTabbedPane}), '$class'})):setEnabledAt(get({This, gameRobotJTabbedPane}), 1, false),
        (get({get({This, gameRobotJTabbedPane}), '$class'})):setSelectedIndex(get({This, gameRobotJTabbedPane}), 0).

initComponents(This) ->
        put({This, noModuleSelectedJDialog}, 'JDialog':new()),
        put({This, noModuleSelectedJLabel}, 'JLabel':new()),
        put({This, gameRobotJTabbedPane}, 'JTabbedPane':new()),
        put({This, inputAutomationModuleJPanel}, 'JPanel':new()),
        put({This, jScrollPane1}, 'JScrollPane':new()),
        put({This, inputAutomationModuleJList}, 'JList':new()),
        put({This, automationModuleConfigurationJPanel}, 'JPanel':new()),
        put({This, mainJMenuBar}, 'JMenuBar':new()),
        put({This, processingJMenu}, 'JMenu':new()),
        put({This, startJMenuItem}, 'JMenuItem':new()),
        put({This, stopJMenuItem}, 'JMenuItem':new()),
        put({This, optionsJMenu}, 'JMenu':new()),
        put({This, stopOnFocusJCheckBoxMenuItem}, 'JCheckBoxMenuItem':new()),
        put({This, toolsJMenu}, 'JMenu':new()),
        put({This, helpJMenuItem}, 'JMenuItem':new()),
        put({This, updatesJMenuItem}, 'JMenuItem':new()),
        put({This, subscriptionJMenuItem}, 'JMenuItem':new()),
        put({This, modulesJMenuItem}, 'JMenuItem':new()),
        put({This, aboutJMenuItem}, 'JMenuItem':new()),
        (get({get({This, noModuleSelectedJDialog}), '$class'})):setMinimumSize(get({This, noModuleSelectedJDialog}), 'Dimension':new(200, 100)),
        (get({get({This, noModuleSelectedJLabel}), '$class'})):setText(get({This, noModuleSelectedJLabel}), "Please Select A Module"),
        NoModuleSelectedJDialogLayout = 'GroupLayout':new((get({get({This, noModuleSelectedJDialog}), '$class'})):getContentPane(get({This, noModuleSelectedJDialog}))),
        (fun(Target_N69118) -> (get({Target_N69118, '$class'})):setLayout(Target_N69118, NoModuleSelectedJDialogLayout) end)((get({get({This, noModuleSelectedJDialog}), '$class'})):getContentPane(get({This, noModuleSelectedJDialog}))),
        (get({NoModuleSelectedJDialogLayout, '$class'})):setHorizontalGroup(NoModuleSelectedJDialogLayout, (fun(Target_N69177) -> (get({Target_N69177, '$class'})):addGroup(Target_N69177, (fun(Target_N69245) -> (get({Target_N69245, '$class'})):addContainerGap(Target_N69245, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69252) -> (get({Target_N69252, '$class'})):addComponent(Target_N69252, get({This, noModuleSelectedJLabel})) end)((fun(Target_N69259) -> (get({Target_N69259, '$class'})):addContainerGap(Target_N69259) end)((get({NoModuleSelectedJDialogLayout, '$class'})):createSequentialGroup(NoModuleSelectedJDialogLayout))))) end)((get({NoModuleSelectedJDialogLayout, '$class'})):createParallelGroup(NoModuleSelectedJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({NoModuleSelectedJDialogLayout, '$class'})):setVerticalGroup(NoModuleSelectedJDialogLayout, (fun(Target_N69372) -> (get({Target_N69372, '$class'})):addComponent(Target_N69372, get({This, noModuleSelectedJLabel}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 48, get({'Short', 'MAX_VALUE'})) end)((get({NoModuleSelectedJDialogLayout, '$class'})):createParallelGroup(NoModuleSelectedJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setDefaultCloseOperation(This, get({get({get({'javax', swing}), 'WindowConstants'}), 'EXIT_ON_CLOSE'})),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(325, 215)),
        (get({This, '$class'})):setResizable(This, false),
        (get({This, '$class'})):addWindowFocusListener(This, 'WindowFocusListener':new() % Java anonymous class body: implement it as a module
%             ok % windowGainedFocus
%             ok % windowLostFocus
),
        (get({This, '$class'})):addFocusListener(This, 'FocusAdapter':new() % Java anonymous class body: implement it as a module
%             ok % focusGained
%             ok % focusLost
),
        (get({get({This, gameRobotJTabbedPane}), '$class'})):setMinimumSize(get({This, gameRobotJTabbedPane}), 'Dimension':new(320, 200)),
        (get({get({This, inputAutomationModuleJList}), '$class'})):setMinimumSize(get({This, inputAutomationModuleJList}), 'Dimension':new(200, 0)),
        (get({get({This, inputAutomationModuleJList}), '$class'})):addListSelectionListener(get({This, inputAutomationModuleJList}), 'ListSelectionListener':new() % Java anonymous class body: implement it as a module
%             ok % valueChanged
),
        (get({get({This, jScrollPane1}), '$class'})):setViewportView(get({This, jScrollPane1}), get({This, inputAutomationModuleJList})),
        InputAutomationModuleJPanelLayout = 'GroupLayout':new(get({This, inputAutomationModuleJPanel})),
        (get({get({This, inputAutomationModuleJPanel}), '$class'})):setLayout(get({This, inputAutomationModuleJPanel}), InputAutomationModuleJPanelLayout),
        (get({InputAutomationModuleJPanelLayout, '$class'})):setHorizontalGroup(InputAutomationModuleJPanelLayout, (fun(Target_N70607) -> (get({Target_N70607, '$class'})):addGroup(Target_N70607, (fun(Target_N70675) -> (get({Target_N70675, '$class'})):addContainerGap(Target_N70675, 367, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70682) -> (get({Target_N70682, '$class'})):addComponent(Target_N70682, get({This, jScrollPane1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 199, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({InputAutomationModuleJPanelLayout, '$class'})):createSequentialGroup(InputAutomationModuleJPanelLayout)))) end)((get({InputAutomationModuleJPanelLayout, '$class'})):createParallelGroup(InputAutomationModuleJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({InputAutomationModuleJPanelLayout, '$class'})):setVerticalGroup(InputAutomationModuleJPanelLayout, (fun(Target_N70834) -> (get({Target_N70834, '$class'})):addGroup(Target_N70834, (fun(Target_N70902) -> (get({Target_N70902, '$class'})):addContainerGap(Target_N70902, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70909) -> (get({Target_N70909, '$class'})):addComponent(Target_N70909, get({This, jScrollPane1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 330, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({InputAutomationModuleJPanelLayout, '$class'})):createSequentialGroup(InputAutomationModuleJPanelLayout)))) end)((get({InputAutomationModuleJPanelLayout, '$class'})):createParallelGroup(InputAutomationModuleJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, gameRobotJTabbedPane}), '$class'})):addTab(get({This, gameRobotJTabbedPane}), "Modules", get({This, inputAutomationModuleJPanel})),
        AutomationModuleConfigurationJPanelLayout = 'GroupLayout':new(get({This, automationModuleConfigurationJPanel})),
        (get({get({This, automationModuleConfigurationJPanel}), '$class'})):setLayout(get({This, automationModuleConfigurationJPanel}), AutomationModuleConfigurationJPanelLayout),
        (get({AutomationModuleConfigurationJPanelLayout, '$class'})):setHorizontalGroup(AutomationModuleConfigurationJPanelLayout, (fun(Target_N71246) -> (get({Target_N71246, '$class'})):addGap(Target_N71246, 0, 566, get({'Short', 'MAX_VALUE'})) end)((get({AutomationModuleConfigurationJPanelLayout, '$class'})):createParallelGroup(AutomationModuleConfigurationJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({AutomationModuleConfigurationJPanelLayout, '$class'})):setVerticalGroup(AutomationModuleConfigurationJPanelLayout, (fun(Target_N71363) -> (get({Target_N71363, '$class'})):addGap(Target_N71363, 0, 334, get({'Short', 'MAX_VALUE'})) end)((get({AutomationModuleConfigurationJPanelLayout, '$class'})):createParallelGroup(AutomationModuleConfigurationJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, gameRobotJTabbedPane}), '$class'})):addTab(get({This, gameRobotJTabbedPane}), "Configuration", get({This, automationModuleConfigurationJPanel})),
        (get({get({This, processingJMenu}), '$class'})):setText(get({This, processingJMenu}), "Processing"),
        (get({get({This, processingJMenu}), '$class'})):setToolTipText(get({This, processingJMenu}), "Set module processing state"),
        (get({get({This, startJMenuItem}), '$class'})):setText(get({This, startJMenuItem}), get({get({This, commonStrings}), 'START'})),
        (get({get({This, startJMenuItem}), '$class'})):addActionListener(get({This, startJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, startJMenuItem})),
        (get({get({This, stopJMenuItem}), '$class'})):setText(get({This, stopJMenuItem}), "Stop"),
        (get({get({This, stopJMenuItem}), '$class'})):addActionListener(get({This, stopJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, stopJMenuItem})),
        (get({get({This, mainJMenuBar}), '$class'})):add(get({This, mainJMenuBar}), get({This, processingJMenu})),
        (get({get({This, optionsJMenu}), '$class'})):setText(get({This, optionsJMenu}), "Options"),
        (get({get({This, optionsJMenu}), '$class'})):addActionListener(get({This, optionsJMenu}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, stopOnFocusJCheckBoxMenuItem}), '$class'})):setSelected(get({This, stopOnFocusJCheckBoxMenuItem}), true),
        (get({get({This, stopOnFocusJCheckBoxMenuItem}), '$class'})):setEnabled(get({This, stopOnFocusJCheckBoxMenuItem}), false),
        (get({get({This, stopOnFocusJCheckBoxMenuItem}), '$class'})):setLabel(get({This, stopOnFocusJCheckBoxMenuItem}), "Stop Module On Focus"),
        (get({get({This, stopOnFocusJCheckBoxMenuItem}), '$class'})):addActionListener(get({This, stopOnFocusJCheckBoxMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, optionsJMenu}), '$class'})):add(get({This, optionsJMenu}), get({This, stopOnFocusJCheckBoxMenuItem})),
        (get({get({This, mainJMenuBar}), '$class'})):add(get({This, mainJMenuBar}), get({This, optionsJMenu})),
        (get({get({This, toolsJMenu}), '$class'})):setText(get({This, toolsJMenu}), "Help"),
        (get({get({This, helpJMenuItem}), '$class'})):setText(get({This, helpJMenuItem}), "Help"),
        (get({get({This, helpJMenuItem}), '$class'})):addActionListener(get({This, helpJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, toolsJMenu}), '$class'})):add(get({This, toolsJMenu}), get({This, helpJMenuItem})),
        (get({get({This, updatesJMenuItem}), '$class'})):setText(get({This, updatesJMenuItem}), "Updates"),
        (get({get({This, updatesJMenuItem}), '$class'})):addActionListener(get({This, updatesJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, toolsJMenu}), '$class'})):add(get({This, toolsJMenu}), get({This, updatesJMenuItem})),
        (get({get({This, subscriptionJMenuItem}), '$class'})):setText(get({This, subscriptionJMenuItem}), "Subscription"),
        (get({get({This, subscriptionJMenuItem}), '$class'})):addActionListener(get({This, subscriptionJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, toolsJMenu}), '$class'})):add(get({This, toolsJMenu}), get({This, subscriptionJMenuItem})),
        (get({get({This, modulesJMenuItem}), '$class'})):setText(get({This, modulesJMenuItem}), "Module Manager"),
        (get({get({This, modulesJMenuItem}), '$class'})):addActionListener(get({This, modulesJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, toolsJMenu}), '$class'})):add(get({This, toolsJMenu}), get({This, modulesJMenuItem})),
        (get({get({This, aboutJMenuItem}), '$class'})):setText(get({This, aboutJMenuItem}), "About"),
        (get({get({This, aboutJMenuItem}), '$class'})):addActionListener(get({This, aboutJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, toolsJMenu}), '$class'})):add(get({This, toolsJMenu}), get({This, aboutJMenuItem})),
        (get({get({This, mainJMenuBar}), '$class'})):add(get({This, mainJMenuBar}), get({This, toolsJMenu})),
        (get({This, '$class'})):setJMenuBar(This, get({This, mainJMenuBar})),
        Layout = 'GroupLayout':new((get({This, '$class'})):getContentPane(This)),
        (fun(Target_N73864) -> (get({Target_N73864, '$class'})):setLayout(Target_N73864, Layout) end)((get({This, '$class'})):getContentPane(This)),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N73912) -> (get({Target_N73912, '$class'})):addComponent(Target_N73912, get({This, gameRobotJTabbedPane}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 571, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N74105) -> (get({Target_N74105, '$class'})):addComponent(Target_N74105, get({This, gameRobotJTabbedPane}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 359, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):pack(This).

subscriptionJMenuItemActionPerformed(This, Evt) ->
        try
            (fun(Target_N74330) -> (get({Target_N74330, '$class'})):browse(Target_N74330, get({This, uri})) end)('Desktop':getDesktop())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "subscriptionJMenuItemActionPerformed", E)
        end.

updatesJMenuItemActionPerformed(This, Evt) ->
        try
            (fun(Target_N74565) -> (get({Target_N74565, '$class'})):browse(Target_N74565, get({This, uri})) end)('Desktop':getDesktop())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updatesJMenuItemActionPerformed", E)
        end.

aboutJMenuItemActionPerformed(This, Evt) ->
        TextJDialog = 'BasicTextJDialog':new("Copyright (c) 2002-2007 AllBinary"),
        (get({TextJDialog, '$class'})):setVisible(TextJDialog, true),
        (get({TextJDialog, '$class'})):setLocationRelativeTo(TextJDialog, This).

modulesJMenuItemActionPerformed(This, Evt) ->
        try
            (fun(Target_N74990) -> (get({Target_N74990, '$class'})):start(Target_N74990) end)('DesktopBundle':new())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "modulesJMenuItemActionPerformed", E)
        end.

helpJMenuItemActionPerformed(This, Evt) ->
        (fun(Target_N75199) -> (get({Target_N75199, '$class'})):show(Target_N75199, get({This, helpSet})) end)('JavaHelpUtil':getInstance()).

stopOnFocusJCheckBoxMenuItemActionPerformed(This, Evt) ->
        ok.

optionsJMenuActionPerformed(This, Evt) ->
        ok.

formWindowLostFocus(This, Evt) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Nothing", This, "focusLost").

formWindowGainedFocus(This, Evt) ->
        case (get({get({This, stopOnFocusJCheckBoxMenuItem}), '$class'})):isSelected(get({This, stopOnFocusJCheckBoxMenuItem})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Stopping", This, "focusGained"),
            case (get({This, runnableInterface}) =/= undefined) of
                true ->
                (get({get({This, runnableInterface}), '$class'})):setRunning(get({This, runnableInterface}), false);
                false -> ok
            end;
            false -> ok
        end.

formFocusLost(This, Evt) ->
        ok.

formFocusGained(This, Evt) ->
        ok.

inputAutomationModuleJListValueChanged(This, Evt) ->
        try
            GameAutomationRobotModuleNameString = (get({get({This, inputAutomationModuleJList}), '$class'})):getSelectedValue(get({This, inputAutomationModuleJList})),
            case (GameAutomationRobotModuleNameString =/= undefined) of
                true ->
                put({This, inputAutomationModuleInterface}, (get({get({This, inputAutomationModuleFactory}), '$class'})):getInstance(get({This, inputAutomationModuleFactory}), GameAutomationRobotModuleNameString)),
                (fun(Target_N76228) -> (get({Target_N76228, '$class'})):removeAll(Target_N76228) end)((get({This, '$class'})):getAutomationModuleConfigurationJPanel(This)),
                Layout = (fun(Target_N76262) -> (get({Target_N76262, '$class'})):getLayout(Target_N76262) end)((get({This, '$class'})):getAutomationModuleConfigurationJPanel(This)),
                (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N76358) -> (get({Target_N76358, '$class'})):addComponent(Target_N76358, (get({get({This, inputAutomationModuleInterface}), '$class'})):getConfigurationJPanel(get({This, inputAutomationModuleInterface})), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N76365) -> (get({Target_N76365, '$class'})):addGap(Target_N76365, 0, 395, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
                (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N76601) -> (get({Target_N76601, '$class'})):addComponent(Target_N76601, (get({get({This, inputAutomationModuleInterface}), '$class'})):getConfigurationJPanel(get({This, inputAutomationModuleInterface})), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N76608) -> (get({Target_N76608, '$class'})):addGap(Target_N76608, 0, 256, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
                (get({get({This, gameRobotJTabbedPane}), '$class'})):setEnabledAt(get({This, gameRobotJTabbedPane}), 1, true),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Setting Module: ", GameAutomationRobotModuleNameString]), " and Configuration JPanel"]), This, "gameAutomationRobotModuleJListValueChanged");
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Module name was null", This, "gameAutomationRobotModuleJListValueChanged"),
                (get({get({This, gameRobotJTabbedPane}), '$class'})):setEnabledAt(get({This, gameRobotJTabbedPane}), 1, false)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "gameAutomationRobotModuleJListValueChanged", E)
        end.

stopJMenuItemActionPerformed(This, Evt) ->
        case (get({This, runnableInterface}) =/= undefined) of
            true ->
            (get({get({This, runnableInterface}), '$class'})):setRunning(get({This, runnableInterface}), false);
            false ->
            (get({get({This, noModuleSelectedJDialog}), '$class'})):setVisible(get({This, noModuleSelectedJDialog}), true),
            (get({get({This, noModuleSelectedJDialog}), '$class'})):setLocationRelativeTo(get({This, noModuleSelectedJDialog}), This)
        end.

startJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "startJMenuItemActionPerformed"),
            case (get({This, inputAutomationModuleInterface}) =/= undefined) of
                true ->
                put({This, runnableInterface}, (get({get({This, inputAutomationModuleInterface}), '$class'})):getInstance(get({This, inputAutomationModuleInterface}))),
                case (get({This, runnableInterface}) =/= undefined) of
                    true ->
                    put({This, thread}, 'Thread':new(get({This, runnableInterface}))),
                    (get({get({This, thread}), '$class'})):setPriority(get({This, thread}), (get({'Thread', 'MIN_PRIORITY'}) + 1)),
                    (get({get({This, thread}), '$class'})):start(get({This, thread}));
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Runnnable was null", This, "startJMenuItemActionPerformed"),
                    (get({get({This, noModuleSelectedJDialog}), '$class'})):setVisible(get({This, noModuleSelectedJDialog}), true),
                    (get({get({This, noModuleSelectedJDialog}), '$class'})):setLocationRelativeTo(get({This, noModuleSelectedJDialog}), This)
                end;
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "InputAutomationModuleInterface was null", This, "startJMenuItemActionPerformed"),
                (get({get({This, noModuleSelectedJDialog}), '$class'})):setVisible(get({This, noModuleSelectedJDialog}), true),
                (get({get({This, noModuleSelectedJDialog}), '$class'})):setLocationRelativeTo(get({This, noModuleSelectedJDialog}), This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "startJMenuItemActionPerformed", E)
        end.

getInstance() ->
        get({'InputAutomationJFrame', 'INPUTAUTOMATION_JFRAME'}).

destroy() ->
        (get({get({'InputAutomationJFrame', 'INPUTAUTOMATION_JFRAME'}), '$class'})):setVisible(get({'InputAutomationJFrame', 'INPUTAUTOMATION_JFRAME'}), false).

create(InputAutomationBundleActivatorListenerInterface) ->
        'LogConfigTypeFactory':getInstance(),
        AppUrlGlobals = 'AppUrlGlobals':new(),
        (get({AppUrlGlobals, '$class'})):setWebappPath(AppUrlGlobals, "G:/mnt/bc/mydev/work_automation/automation/run/"),
        (get({get({'InputAutomationJFrame', 'URLGLOBALS'}), '$class'})):init(get({'InputAutomationJFrame', 'URLGLOBALS'}), AppUrlGlobals),
        'WebappClassLoaderInfo':setLoader((get({get({AppUrlGlobals, '$class'}), '$class'})):getClassLoader(get({AppUrlGlobals, '$class'}))),
        (get({get({get({'java', awt}), 'EventQueue'}), '$class'})):invokeLater(get({get({'java', awt}), 'EventQueue'}), 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
).

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        'InputAutomationJFrame':create(undefined).

getAutomationModuleConfigurationJPanel(This) ->
        get({This, automationModuleConfigurationJPanel}).

setAutomationModuleConfigurationJPanel(This, AutomationModuleConfigurationJPanel) ->
        put({This, automationModuleConfigurationJPanel}, AutomationModuleConfigurationJPanel).

onAdd(This, InputAutomationRobotChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onAdd"),
            (fun(Target_N79181) -> (get({Target_N79181, '$class'})):add(Target_N79181, (fun(Target_N79206) -> (get({Target_N79206, '$class'})):getInputRobotInterface(Target_N79206) end)((get({InputAutomationRobotChangeEvent, '$class'})):getInputAutomationRobotInterfaceWrapper(InputAutomationRobotChangeEvent))) end)('InputRobotFactory':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onAdd", E)
        end;
onAdd(This, InputAutomationConfigurationChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onAdd"),
            (get({get({This, inputAutomationModuleConfigurations}), '$class'})):add(get({This, inputAutomationModuleConfigurations}), (get({InputAutomationConfigurationChangeEvent, '$class'})):getInputAutomationModuleConfiguration(InputAutomationConfigurationChangeEvent)),
            (get({This, '$class'})):init(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onAdd", E)
        end.

onRemove(This, InputAutomationRobotChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onRemove"),
            (fun(Target_N79442) -> (get({Target_N79442, '$class'})):add(Target_N79442, (fun(Target_N79467) -> (get({Target_N79467, '$class'})):getInputRobotInterface(Target_N79467) end)((get({InputAutomationRobotChangeEvent, '$class'})):getInputAutomationRobotInterfaceWrapper(InputAutomationRobotChangeEvent))) end)('InputRobotFactory':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onRemove", E)
        end;
onRemove(This, InputAutomationConfigurationChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onRemove"),
            InputAutomationConfiguration = get({'InputAutomationConfigurationFactory':getInstance(), inputAutomationConfiguration}),
            InputAutomationModuleConfigurationList = (get({InputAutomationConfiguration, '$class'})):getInputAutomationModuleConfigurationList(InputAutomationConfiguration),
            case (InputAutomationModuleConfigurationList =:= undefined) of
                true ->
                LogUtil = 'LogUtil':getInstance(),
                CommonStrings = 'CommonStrings':getInstance(),
                (get({LogUtil, '$class'})):putF(LogUtil, lists:concat(["inputAutomationModuleConfigurationList: ", InputAutomationModuleConfigurationList]), This, get({CommonStrings, 'INIT'})),
                erlang:error({'Exception'});
                false -> ok
            end,
            InputAutomationModuleConfigurations = 'InputAutomationModuleConfigurations':new((get({InputAutomationConfiguration, '$class'})):getInputAutomationModuleConfigurationList(InputAutomationConfiguration)),
            (get({InputAutomationModuleConfigurations, '$class'})):remove(InputAutomationModuleConfigurations, (get({InputAutomationConfigurationChangeEvent, '$class'})):getInputAutomationModuleConfiguration(InputAutomationConfigurationChangeEvent)),
            (get({This, '$class'})):init(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onRemove", E)
        end.



