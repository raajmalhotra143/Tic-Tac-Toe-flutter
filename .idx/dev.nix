# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.11"; # Updated to a more recent stable version

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.flutter       # Missing: Required to run the flutter commands below
    pkgs.jdk21
    pkgs.unzip
    pkgs.nodejs_22     # Required for your MCP servers (Firebase, Supabase, etc.)
    pkgs.firebase-tools
    pkgs.google-cloud-sdk
    pkgs.xsel          # Useful for clipboard operations in the terminal
  ];

  # Sets environment variables in the workspace
  env = {};

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "google.gemini-cli-vscode-ide-companion" # Essential for your Gemini CLI workflow
    ];

    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Ensures your Flutter setup is ready
        flutter-doctor = "flutter doctor";
      };
      
      # To run something each time the workspace is (re)started
      onStart = {
        # Verifies your tools are active on start
        check-tools = "gcloud --version && firebase --version";
      };
    };

    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
          manager = "flutter";
        };
        android = {
          # IDX handles the android emulator connection automatically
          command = ["flutter" "run" "--machine" "-d" "android"];
          manager = "flutter";
        };
      };
    };
  };
}