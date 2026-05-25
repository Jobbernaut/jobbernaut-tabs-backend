import io.quarkus.security.Authenticated
import jakarta.ws.rs.*
import jakarta.ws.rs.core.MediaType
import jakarta.ws.rs.core.Response
import org.eclipse.microprofile.jwt.JsonWebToken
import jakarta.inject.Inject

@Path("/jobs")
@Authenticated
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class JobResource {

    @Inject
    lateinit var jwt: JsonWebToken

    @GET
    fun getJobs(): Response {
        val userId = jwt.subject // this is the Cognito user's unique ID
        val email = jwt.getClaim<String>("email")
        return Response.ok(mapOf("userId" to userId, "email" to email)).build()
    }
}