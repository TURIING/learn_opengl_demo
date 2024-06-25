#version 330 core
layout(location = 0) in vec3 aPos;
layout(location = 1) in vec3 aNormal;
layout(location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 WorldPos;
out vec3 Normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main() {

  TexCoords = aTexCoords;
  WorldPos = vec3(model * vec4(aPos, 1.0f));

   // 解决不等比缩放，对法向量产生的影响
  // Normal = mat3(transpose(inverse(model))) * aNormal;
  Normal = mat3(model) * aNormal;

  gl_Position = projection * view * vec4(WorldPos, 1.0f);
}