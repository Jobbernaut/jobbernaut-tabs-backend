FROM public.ecr.aws/lambda/java:25

# Copy Quarkus fast-jar layout
COPY target/quarkus-app/lib/     ${LAMBDA_TASK_ROOT}/lib/
COPY target/quarkus-app/*.jar    ${LAMBDA_TASK_ROOT}/
COPY target/quarkus-app/app/     ${LAMBDA_TASK_ROOT}/app/
COPY target/quarkus-app/quarkus/ ${LAMBDA_TASK_ROOT}/quarkus/

CMD ["io.quarkus.amazon.lambda.runtime.QuarkusStreamHandler::handleRequest"]