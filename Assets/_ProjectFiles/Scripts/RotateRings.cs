using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateRings : MonoBehaviour
{
    //This script controls the ring rotation

    public Transform ringRotator;
    public float breathesPerMinute = 2f;
    public float maxRotation = 45f;
    private float startTime;
    private bool active = false;

    void Update()
    {
        if (active)
        {
            ringRotator.localRotation = Quaternion.Euler(0f, 0f, maxRotation * Mathf.Sin((Time.time - startTime) / (15f / breathesPerMinute)));
        }
    }
    public void StartRings()
    {
        startTime = Time.time;
        active = true;
    }
    public void StopRings ()
    {
        active = false;
        StartCoroutine(ResetRings(3f));
    }

    IEnumerator ResetRings(float duration)
    {
        var elapsedTime = 0f;

        var mRot = ringRotator.localRotation;
        while (elapsedTime < duration)
        {
            ringRotator.localRotation = Quaternion.Lerp(mRot, Quaternion.identity, Mathf.SmoothStep(0.0f, 1.0f, elapsedTime / duration));
            elapsedTime += Time.deltaTime;
            yield return null;
        }
    }
}
