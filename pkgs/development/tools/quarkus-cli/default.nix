{ lib, stdenv, fetchzip, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "quarkus-cli";
  version = "3.2.11.Final";

  src = fetchzip {
    url = "https://github.com/quarkusio/quarkus/releases/download/${version}/${pname}-${version}.tar.gz";
    sha256 = "sha256-CSentspHMPWaIJyfW1HgcRhO+Vk7tLyqzr21vZUELrA=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    cp -r . $out
    wrapProgram $out/bin/quarkus
    runHook postInstall
  '';

  meta = with lib; {
    description = "Quarkus CLI is a command line tool for developing applications with Quarkus, a Kubernetes Native Java stack tailored for GraalVM and OpenJDK HotSpot. It provides tools for generating projects, building, testing, packaging, extending, and deploying Quarkus applications efficiently.";
    longDescription = ''
    Quarkus CLI (Command Line Interface) is a powerful tool that helps developers build and deploy applications quicklyand efficiently using the Quarkus framework. Quarkus is a Kubernetes Native Java stack for GraalVM and HotSpot. It provides a lightweight, fast, and efficient platform for developing cloud-native applications.

    With Quarkus CLI, developers can create new projects, manage dependencies, build and package applications, run tests, and deploy them to various cloud platforms with just a few simple commands. The CLI provides a variety of features such as live reload, code generation, interactive mode, and more, making it easy for developers to streamline their development workflow.

    In addition, Quarkus CLI integrates seamlessly with popular build tools such as Maven and Gradle, allowing developers to leverage existing skills and tools. It also provides a robust plugin system that extends its functionality and enables developers to customize their development environment according to their preferences.

    Overall, Quarkus CLI is a versatile and user-friendly tool that empowers developers to focus on writing code and building applications without getting bogged down by complex configuration and setup tasks. By simplifying the development process and providing a seamless experience, Quarkus CLI helps developers save time and effort while delivering high-performance and scalable applications.
    '';
    homepage = "https://micronaut.io/";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ ];
    mainProgram = "quarkus";
  };
}
