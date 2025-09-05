*** Begin Patch
*** Update File: docker/rosetta/rosetta.Dockerfile
@@
-FROM alpine:3.19
-RUN echo "baseline rosetta image" > /image.txt
-CMD ["cat", "/image.txt"]
+FROM alpine:3.19
+# Benign change only to ensure this file is "touched" for the pull_request path filter
+RUN echo "attacker-controlled Dockerfile content (PoC only)" > /poc.txt
+CMD ["cat", "/poc.txt"]
*** End Patch
