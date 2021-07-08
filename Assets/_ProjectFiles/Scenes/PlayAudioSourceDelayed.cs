using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayAudioSourceDelayed : MonoBehaviour {

    private AudioSource m_AudioSource;
    [SerializeField] private float m_Delay;

	// Use this for initialization
	void Awake () {
        m_AudioSource = GetComponent<AudioSource>();
        StartCoroutine(PlayTimeline());
    }

    private IEnumerator PlayTimeline() {
        yield return new WaitForSeconds(m_Delay);
        m_AudioSource.Play();
    }

}
