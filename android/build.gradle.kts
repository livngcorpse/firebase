// ✅ Root-level build.gradle.kts (project/build.gradle.kts)

plugins {
    // your Android/Kotlin plugins (if declared here)
    // id("com.android.application") version "8.2.2" apply false
    // id("org.jetbrains.kotlin.android") version "1.9.0" apply false

    // ✅ Add the Google services Gradle plugin here
    id("com.google.gms.google-services") version "4.4.3" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
