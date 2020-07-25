#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using workspacer;
using workspacer.Bar;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;


Action<IConfigContext> doConfig = (context) =>
{
    context.DefaultLayouts = () => new ILayoutEngine[] {
        new TallLayoutEngine(),
        new FullLayoutEngine(),
    };

    context.AddFocusIndicator();
    context.Keybinds.UnsubscribeAll();

    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Q, context.Quit, "Quit workspacer");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.W, context.Restart, "Restart workspacer");

    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Delete, () => context.Workspaces.FocusedWorkspace.CloseFocusedWindow(), "Close focused window");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Left, () => context.Workspaces.FocusedWorkspace.ShrinkPrimaryArea(), "Shrink primary area");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Right, () => context.Workspaces.FocusedWorkspace.ExpandPrimaryArea(), "Expand primary area");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Down, () => context.Workspaces.FocusedWorkspace.FocusNextWindow(), "Focus next window");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Up, () => context.Workspaces.FocusedWorkspace.FocusPreviousWindow(), "Focus previous window");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.Space, () => context.Workspaces.FocusedWorkspace.FocusPrimaryWindow(), "Focus primary window");

    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.Z, () => context.Workspaces.FocusedWorkspace.NextLayoutEngine(), "Next layout engine");

    context.Keybinds.Subscribe(KeyModifiers.Control | KeyModifiers.Win, Keys.Space, () => context.Workspaces.FocusedWorkspace.SwapFocusAndPrimaryWindow(), "Swap focus/primary window");
    context.Keybinds.Subscribe(KeyModifiers.Control | KeyModifiers.Win, Keys.Down, () => context.Workspaces.FocusedWorkspace.SwapFocusAndNextWindow(), "Swap focus/next window");
    context.Keybinds.Subscribe(KeyModifiers.Control | KeyModifiers.Win, Keys.Up, () => context.Workspaces.FocusedWorkspace.SwapFocusAndPreviousWindow(), "Swap focus/previous window");
    context.Keybinds.Subscribe(KeyModifiers.Control | KeyModifiers.Win, Keys.Right, () => context.Workspaces.FocusedWorkspace.IncrementNumberOfPrimaryWindows(), "Increment # of primary windows");
    context.Keybinds.Subscribe(KeyModifiers.Control | KeyModifiers.Win, Keys.Left, () => context.Workspaces.FocusedWorkspace.DecrementNumberOfPrimaryWindows(), "Decrement # of primary windows");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.A, () => context.Windows.ToggleFocusedWindowTiling(), "Toggle tiling for focused window");

    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D1, () => context.Workspaces.SwitchToWorkspace(0), "Switch to workspace 1");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D2, () => context.Workspaces.SwitchToWorkspace(1), "Switch to workspace 2");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D3, () => context.Workspaces.SwitchToWorkspace(2), "Switch to workspace 3");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D4, () => context.Workspaces.SwitchToWorkspace(3), "Switch to workspace 4");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D5, () => context.Workspaces.SwitchToWorkspace(4), "Switch to workspace 5");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D6, () => context.Workspaces.SwitchToWorkspace(5), "Switch to workspace 6");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D7, () => context.Workspaces.SwitchToWorkspace(6), "Switch to workspace 7");
    context.Keybinds.Subscribe(KeyModifiers.Win, Keys.D8, () => context.Workspaces.SwitchToWorkspace(7), "Switch to workspace 8");

    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D1, () => context.Workspaces.MoveFocusedWindowToWorkspace(0), "Move focused window to workspace 1");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D2, () => context.Workspaces.MoveFocusedWindowToWorkspace(1), "Move focused window to workspace 2");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D3, () => context.Workspaces.MoveFocusedWindowToWorkspace(2), "Move focused window to workspace 3");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D4, () => context.Workspaces.MoveFocusedWindowToWorkspace(3), "Move focused window to workspace 4");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D5, () => context.Workspaces.MoveFocusedWindowToWorkspace(4), "Move focused window to workspace 5");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D6, () => context.Workspaces.MoveFocusedWindowToWorkspace(5), "Move focused window to workspace 6");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D7, () => context.Workspaces.MoveFocusedWindowToWorkspace(6), "Move focused window to workspace 7");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D8, () => context.Workspaces.MoveFocusedWindowToWorkspace(7), "Move focused window to workspace 8");
    context.Keybinds.Subscribe(KeyModifiers.Shift | KeyModifiers.Win, Keys.D9, () => context.Workspaces.MoveFocusedWindowToWorkspace(8), "Move focused window to workspace 9");

    context.WorkspaceContainer.CreateWorkspaces("1", "2", "3", "4", "5", "6", "7", "8", "9");
};
return doConfig;