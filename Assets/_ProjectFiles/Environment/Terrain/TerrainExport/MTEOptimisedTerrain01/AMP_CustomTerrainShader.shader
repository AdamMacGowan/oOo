// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AMP_CustomTerrainShader"
{
	Properties
	{
		_Diffuse1("Diffuse1", 2D) = "white" {}
		_Normal1("Normal1", 2D) = "bump" {}
		_Diffuse2("Diffuse2", 2D) = "white" {}
		_Normal2("Normal2", 2D) = "bump" {}
		_Diffuse3("Diffuse3", 2D) = "white" {}
		_Normal3("Normal3", 2D) = "bump" {}
		_Diffuse4("Diffuse4", 2D) = "white" {}
		_Normal4("Normal4", 2D) = "bump" {}
		_Control("Control", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Glossiness("Glossiness", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Control;
		uniform float4 _Control_ST;
		uniform sampler2D _Normal1;
		uniform float4 _Normal1_ST;
		uniform sampler2D _Normal2;
		uniform float4 _Normal2_ST;
		uniform sampler2D _Normal3;
		uniform float4 _Normal3_ST;
		uniform sampler2D _Normal4;
		uniform float4 _Normal4_ST;
		uniform sampler2D _Diffuse1;
		uniform float4 _Diffuse1_ST;
		uniform sampler2D _Diffuse2;
		uniform float4 _Diffuse2_ST;
		uniform sampler2D _Diffuse3;
		uniform float4 _Diffuse3_ST;
		uniform sampler2D _Diffuse4;
		uniform float4 _Diffuse4_ST;
		uniform float _Metallic;
		uniform float _Glossiness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Control = i.uv_texcoord * _Control_ST.xy + _Control_ST.zw;
			float4 tex2DNode6 = tex2D( _Control, uv_Control );
			float2 uv_Normal1 = i.uv_texcoord * _Normal1_ST.xy + _Normal1_ST.zw;
			float2 uv_Normal2 = i.uv_texcoord * _Normal2_ST.xy + _Normal2_ST.zw;
			float2 uv_Normal3 = i.uv_texcoord * _Normal3_ST.xy + _Normal3_ST.zw;
			float2 uv_Normal4 = i.uv_texcoord * _Normal4_ST.xy + _Normal4_ST.zw;
			o.Normal = ( ( tex2DNode6.r * UnpackNormal( tex2D( _Normal1, uv_Normal1 ) ) ) + ( tex2DNode6.g * UnpackNormal( tex2D( _Normal2, uv_Normal2 ) ) ) + ( tex2DNode6.b * UnpackNormal( tex2D( _Normal3, uv_Normal3 ) ) ) + ( tex2DNode6.a * UnpackNormal( tex2D( _Normal4, uv_Normal4 ) ) ) );
			float2 uv_Diffuse1 = i.uv_texcoord * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
			float2 uv_Diffuse2 = i.uv_texcoord * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
			float2 uv_Diffuse3 = i.uv_texcoord * _Diffuse3_ST.xy + _Diffuse3_ST.zw;
			float2 uv_Diffuse4 = i.uv_texcoord * _Diffuse4_ST.xy + _Diffuse4_ST.zw;
			o.Albedo = ( ( tex2DNode6.r * tex2D( _Diffuse1, uv_Diffuse1 ) ) + ( tex2DNode6.g * tex2D( _Diffuse2, uv_Diffuse2 ) ) + ( tex2DNode6.b * tex2D( _Diffuse3, uv_Diffuse3 ) ) + ( tex2DNode6.a * tex2D( _Diffuse4, uv_Diffuse4 ) ) ).rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17000
2615;-58;2397;1252;310.898;-38.73195;1.3;True;True
Node;AmplifyShaderEditor.SamplerNode;6;-706.2994,-459.6999;Float;True;Property;_Control;Control;8;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-526.8074,1139.353;Float;True;Property;_Normal2;Normal2;3;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-602.6077,883.4526;Float;True;Property;_Normal1;Normal1;1;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-718.3461,553.6859;Float;True;Property;_Diffuse4;Diffuse4;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-776.6353,319.7357;Float;True;Property;_Diffuse3;Diffuse3;4;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-818.9031,80.59641;Float;True;Property;_Diffuse2;Diffuse2;2;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-808.9569,-170.45;Float;True;Property;_Diffuse1;Diffuse1;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;15;-418.2076,1393.053;Float;True;Property;_Normal3;Normal3;5;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;16;-322.7076,1649.653;Float;True;Property;_Normal4;Normal4;7;0;Create;True;0;0;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;246.5923,1223.553;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;44.96436,155.5498;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;360.5923,1402.553;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-45.03564,-10.45025;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;159.9644,305.5497;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;41.59235,907.5526;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;273.9643,484.5497;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;131.5923,1073.553;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;21;836.7239,667.6389;Float;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;11;834.0776,367.8281;Float;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;22;1203.602,861.632;Float;False;Property;_Metallic;Metallic;9;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;23;1219.202,1016.332;Float;False;Property;_Glossiness;Glossiness;10;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1723.633,722.814;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;AMP_CustomTerrainShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;19;0;6;3
WireConnection;19;1;15;0
WireConnection;8;0;6;2
WireConnection;8;1;2;0
WireConnection;20;0;6;4
WireConnection;20;1;16;0
WireConnection;7;0;6;1
WireConnection;7;1;1;0
WireConnection;9;0;6;3
WireConnection;9;1;3;0
WireConnection;17;0;6;1
WireConnection;17;1;13;0
WireConnection;10;0;6;4
WireConnection;10;1;5;0
WireConnection;18;0;6;2
WireConnection;18;1;14;0
WireConnection;21;0;17;0
WireConnection;21;1;18;0
WireConnection;21;2;19;0
WireConnection;21;3;20;0
WireConnection;11;0;7;0
WireConnection;11;1;8;0
WireConnection;11;2;9;0
WireConnection;11;3;10;0
WireConnection;0;0;11;0
WireConnection;0;1;21;0
WireConnection;0;3;22;0
WireConnection;0;4;23;0
ASEEND*/
//CHKSM=B9B611BAAA2875E5561839E77F441D62AE634103