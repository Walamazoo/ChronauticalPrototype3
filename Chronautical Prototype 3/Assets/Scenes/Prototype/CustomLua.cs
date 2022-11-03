using UnityEngine;
using PixelCrushers.DialogueSystem;

// Rename this class to the same name that you used for the script file.
// Add the script to your Dialogue Manager. You can optionally make this 
// a static class and remove the inheritance from MonoBehaviour, in which
// case you won't add it to the Dialogue Manager.
//
// This class registers two example functions: 
//
// - DebugLog(string) writes a string to the Console using Unity's Debug.Log().
// - AddOne(double) returns the value plus one.
//
// You can use these functions as models and then replace them with your own.
public class CustomLua : MonoBehaviour
{
    [SerializeField] TextMesh text;

    [Tooltip("Typically leave unticked so temporary Dialogue Managers don't unregister your functions.")]
    public bool unregisterOnDisable = false;

    private double number = 0;

    void OnEnable()
    {
        // Make the functions available to Lua: (Replace these lines with your own.)
        Lua.RegisterFunction(nameof(DebugLog), this, SymbolExtensions.GetMethodInfo(() => DebugLog(string.Empty)));
        Lua.RegisterFunction(nameof(Reset), this, SymbolExtensions.GetMethodInfo(() => Reset()));
    }

    void OnDisable()
    {
        if (unregisterOnDisable)
        {
            // Remove the functions from Lua: (Replace these lines with your own.)
            Lua.UnregisterFunction(nameof(DebugLog));
            Lua.UnregisterFunction(nameof(Reset));
        }
    }

    public void DebugLog(string message)
    {
        Debug.Log(message);
    }

    public void Add(){
        number++;
    }

    public void Reset()
    { 
        if (number > 5){
            number = 0;
        }
    }
}



/**/
