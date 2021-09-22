using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostEffectScript : MonoBehaviour
{
    public Material mat;

    void OnRenderImage( RenderTexture src, RenderTexture dest) {
        // src is the fully rendered scene that you would normally send directly to monitor
        // We are intercepting this so we can do a bit more work, before passing it on.

        // PRETENDING TO DO IMAGE EFFECT IN CPU
        // Color[] pixels = new Color[1920 * 1080];

        // for (int x = 0; x < 1920; x++)
        // {
        //     for (int y = 0; i < 1080; y++)
        //     {
        //         pixels[x + y*1080].r = 1.18f * 2.17;
        //     }
        // }

        Graphics.Blit(src, dest, mat);
    }
}
