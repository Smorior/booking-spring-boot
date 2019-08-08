package com.booking.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.booking.repository.UserRepository;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	
    private final AuthenticationManager authenticationManager;
    
    private UserRepository userRepo;
    
        
	public JwtAuthenticationFilter(AuthenticationManager authenticationManager, UserRepository userRepo) {
        this.authenticationManager = authenticationManager;
        this.userRepo = userRepo;

        setFilterProcessesUrl(SecurityConstants.AUTH_LOGIN_URL);
    }

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		
		String auth = request.getHeader("Authorization");
		
		String username = new String();
		String password = new String();
		if(auth != null) {
			username = encodeCredentials(auth)[0];
			password = encodeCredentials(auth)[1];
		}
				
					
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
		
		return authenticationManager.authenticate(authenticationToken);

	}

	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {

		UserDetails user  = ((User) authResult.getPrincipal());
		
		com.booking.models.User logedUser = userRepo.findByUsername(user.getUsername());
		
		List<String> roles = user.getAuthorities()
				.stream().map(GrantedAuthority::getAuthority)
				.collect(Collectors.toList());
		
		byte[] signingKey = SecurityConstants.JWT_SECRET.getBytes();
		
		String token = Jwts.builder()
				.signWith(Keys.hmacShaKeyFor(signingKey), SignatureAlgorithm.HS512)
				.setHeaderParam("typ", SecurityConstants.TOKEN_TYPE)
				.setIssuer(SecurityConstants.TOKEN_ISSUER)
				.setAudience(SecurityConstants.TOKEN_AUDIENCE)
				.setSubject(user.getUsername())
				.setExpiration(new Date(System.currentTimeMillis() + SecurityConstants.TOKEN_EXPIRATION))
				.claim("rol", roles)
				.compact();

		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.print("{\"userId\":\""+logedUser.getUserId()+"\",\"username\":\""+ logedUser.getUsername()+"\",\"firstName\":\""+logedUser.getFirstName()+"\",\"lastName\":\""+logedUser.getLastName()+"\",\"email\":\""+logedUser.getEmail()+"\",\"tokenExpiration\":\""+new Date(System.currentTimeMillis() + SecurityConstants.TOKEN_EXPIRATION).getTime()+"\"}");
		response.addHeader("Access-Control-Expose-Headers", "authorization");
		response.addHeader("Access-Control-Allow-Headers", "authorization");
		response.addHeader(SecurityConstants.TOKEN_HEADER, SecurityConstants.TOKEN_PREFIX + token);
	}
	
	
	public String[] encodeCredentials (String auth) {
		String[] result = new String[2];
		if (auth != null) {
			String toDecode = auth.replace("Basic ", "");
			byte[] decodedBytes = Base64.getDecoder().decode(toDecode);
			String decodedString = new String(decodedBytes);
			int index = decodedString.indexOf(":");
			String username = decodedString.substring(0,index);
			String password = decodedString.substring(index+1);
			result[0] = username;
			result[1] = password;
			return result;
		}
		return result;
	}
    
    

}
