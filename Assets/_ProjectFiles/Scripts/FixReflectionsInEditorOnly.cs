using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixReflectionsInEditorOnly : MonoBehaviour
{
    // This is just to fix the reflections in the editor when testing on QuestLink
    public Renderer ReflectionSurface;
    void Start()
    {
#if UNITY_EDITOR
        StartCoroutine(LateStart());
    #endif
    }
    IEnumerator LateStart()
    {
        yield return new WaitForSeconds(0.5f);
        var mat = ReflectionSurface.material;
        mat.SetFloat("_Quest", 1);
        mat.SetFloat("_OffsetEnabled", 1);
    }
}
