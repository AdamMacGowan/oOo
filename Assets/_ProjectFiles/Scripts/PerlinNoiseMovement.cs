using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PerlinNoiseMovement : MonoBehaviour {

    // "Bobbing" animation from 1D Perlin noise.

    // Range over which height varies.
    public float heightScale = 1.0f;

    // Distance covered per second along X axis of Perlin plane.
    public float xScale = 1.0f;


    void Update()
    {
        float height = heightScale * Mathf.PerlinNoise(Time.time * xScale, 0.0f);
        float lateral = heightScale * Mathf.PerlinNoise(0f, (Time.time * xScale) + 999);

        Vector3 pos = transform.localPosition;
        pos.x = lateral;
        pos.y = height;
        transform.localPosition = pos;
    }
}


