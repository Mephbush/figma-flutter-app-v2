#!/bin/sh
# Gradle wrapper script (مسار مخصص داخل android/)

DIR="$(cd "$(dirname "$0")" && pwd)"
JAVA_EXE="${JAVA_HOME}/bin/java"

exec "$JAVA_EXE" -classpath "$DIR/android/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
