FROM public.ecr.aws/lambda/java:25

COPY target/lib/                        ${LAMBDA_TASK_ROOT}/lib/
COPY target/*-runner.jar                ${LAMBDA_TASK_ROOT}/

CMD ["io.quarkus.amazon.lambda.runtime.QuarkusStreamHandler::handleRequest"]