#!/bin/bash

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Please specify a project name"
    exit 1
fi

echo Creating Maven project in $PWD/$PROJECT_NAME...
mkdir -p $PROJECT_NAME/src/{main,test}/{java,resources}

echo "<project>
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.github.$USER</groupId>
  <artifactId>$PROJECT_NAME</artifactId>
  <version>1</version>

  <dependencies>

    <dependency>
      <groupId>org.apache.commons</groupId>
      <artifactId>commons-lang3</artifactId>
      <version>3.8.1</version>
    </dependency>

    <dependency>
      <groupId>org.junit.jupiter</groupId>
      <artifactId>junit-jupiter-api</artifactId>
      <version>5.4.0</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>org.junit.jupiter</groupId>
      <artifactId>junit-jupiter-engine</artifactId>
      <version>5.4.0</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>org.junit.jupiter</groupId>
      <artifactId>junit-jupiter-params</artifactId>
      <version>5.4.0</version>
      <scope>test</scope>
    </dependency>

    <dependency>
      <groupId>org.assertj</groupId>
      <artifactId>assertj-core</artifactId>
      <version>3.12.1</version>
      <scope>test</scope>
    </dependency>

    <dependency>
      <groupId>org.mockito</groupId>
      <artifactId>mockito-core</artifactId>
      <version>2.25.0</version>
    </dependency>
  </dependencies></project>
" > $PROJECT_NAME/pom.xml

echo ".idea
*.iml
*.ipr
*.iws
target" > $PROJECT_NAME/.gitignore

cd $PROJECT_NAME
git init
git add -- pom.xml .gitignore
git commit -m "Added build script and .gitignore"

echo "All done. You can now import the project into your IDE."
