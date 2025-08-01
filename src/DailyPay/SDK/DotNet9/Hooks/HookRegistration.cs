
namespace DailyPay.SDK.DotNet9.Hooks
{
    public static class HookRegistration
    {
        public static void InitHooks(IHooks hooks)
        {
            hooks.RegisterBeforeRequestHook(new PatchAcceptHeaderHook());
        }
    }
}