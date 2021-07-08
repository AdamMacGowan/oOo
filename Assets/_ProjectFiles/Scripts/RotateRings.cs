using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateRings : MonoBehaviour
{
    // Start is called before the first frame update
    public float breathesPerMinute = 2f;
    public float maxRotation = 45f;

    void Update()
    {
        transform.localRotation = Quaternion.Euler(0f, 0f, maxRotation * Mathf.Sin(Time.time / (30 / breathesPerMinute) ));
    }
}
