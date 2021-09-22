Shader "Custom/PostEffectShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            // Runs for every vertex
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;

            // Runs once for every pixel
            fixed4 frag (v2f IN) : SV_Target
            {
               
                fixed4 col = tex2D(_MainTex, IN.uv); // Getting the color of the pixel on the Unity screen
                // just invert the colors
                // col.rgb = 1 - col.rgb;
                col.r = 1;
                return col;
            }
            ENDCG
        }
    }
}
