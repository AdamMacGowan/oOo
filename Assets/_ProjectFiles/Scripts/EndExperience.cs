using Liminal.Core.Fader;
using Liminal.SDK.Core;
using Liminal.SDK.VR.Avatars;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EndExperience : MonoBehaviour
{
    public CompoundScreenFader CompoundScreenFader;
    public MeshScreenFader MeshScreenFader;

    public void End()
    {
        StartCoroutine(EndGame());

        IEnumerator EndGame()
        {


            var elapsedTime = 0f;
            var fadeTime = 5f;
            var startingVolume = AudioListener.volume;

            ScreenFader.Instance.FadeToBlack(fadeTime);

            while (elapsedTime < fadeTime)
            {
                elapsedTime += Time.deltaTime;
                AudioListener.volume = Mathf.Lerp(startingVolume, 0f, elapsedTime / fadeTime);
                yield return new WaitForEndOfFrame();
            }

            yield return ScreenFader.Instance.WaitUntilFadeComplete();
            ExperienceApp.End();
        }
    }
}
