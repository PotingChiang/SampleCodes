package ptc.googlemap;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.http.util.LangUtils;
import org.w3c.dom.Text;

import ptc.googlemap.R.drawable;

import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.GoogleMap.OnMarkerClickListener;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;

import android.R.color;
import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.graphics.Camera;
import android.graphics.Color;
import android.location.GpsSatellite;
import android.location.GpsStatus;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.location.LocationProvider;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


public class GoogleMapActivity extends Activity implements OnClickListener
{

	private static final  String TAG = "Google Map";
	private GoogleMap myMap;
	//setup position's latitude longitude
	private static final  LatLng myCurrentHouse = new LatLng(53.571480, -113.497380);
	private static final  LatLng nait = new LatLng(53.567573, -113.502555);
	private static final LatLng[] myNaitRestaurantPosition = new LatLng[] 
			{
				new LatLng(53.571071, -113.497589),
				new LatLng(53.570306, -113.492396),
				new LatLng(53.570230, -113.489650),
				new LatLng(53.569937, -113.503790),
				new LatLng(53.562660, -113.506194)
			};
	private final static String[] myNaitRestaurantTitle = new String[] 
			{
				"Lan's Asian Grill Ltd",
				"Barbecue House Ltd The",
				"Absolutely Edibles Catering",
				"Ernest's at NAIT",
				"Kingsway Mall"
				
			};
	private final static String[] myNaitRestaurantAddr = new String[]
			{
				"11826 103 St NW Edmonton, AB T5G 0R4",
				"9711 118 Ave NW Edmonton, AB T5G",
				"9567-118 Ave Edmonton, AB T6G 0P1",
				"11762 106 St NW Edmonton, AB T5G 3H6",
				"109 Street & Kingsway Edmonton, AB T5G 3A6"
			};
	private Button btn_MyHome, btn_NAIT, btn_drawLine, btn_Iamhere, btn_NaitRestaurant;
//	private TextView txtOutput;
	
	private Marker myMarker;
	private MarkerOptions myMarkerOpt;
	private CameraUpdate update;
//	private GoogleMapOptions myMapOption;
	
	// my track
	ArrayList<LatLng> myTracks;
	// variables for GPS
	private LocationManager myLocationMgr;
	private String myProvider;
	private CameraPosition myCameraPosition;
	LocationListener myLocationListener = new LocationListener() 
	{
		
		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) 
		{
			switch (status) 
			{
				case LocationProvider.OUT_OF_SERVICE:
				{
					Log.d(TAG, "Status Changed: Out Of Service");
					Toast.makeText(getApplicationContext(), "Status Changed: Out Of Service", Toast.LENGTH_SHORT).show();
					
					break;
				}
				
				case LocationProvider.TEMPORARILY_UNAVAILABLE:
				{
					Log.d(TAG, "Status Changed: Temporarily Unavailable");
					Toast.makeText(getApplicationContext(), "Status Changed: Temporarily Unavailable", Toast.LENGTH_SHORT).show();
					
					break;
				}
				
				case LocationProvider.AVAILABLE:
				{
					Log.d(TAG, "Status Changed: Available");
					Toast.makeText(getApplicationContext(), "Status Changed: Available", Toast.LENGTH_SHORT).show();
					
					break;
				}			
			}
			
		}
		
		@Override
		public void onProviderEnabled(String provider) 
		{
			
		}
		
		@Override
		public void onProviderDisabled(String provider) 
		{

		}
		
		@Override
		public void onLocationChanged(Location location) 
		{
			//update your location automatically
//			whereAmI();
			
		}
	};
	GpsStatus.Listener myGDSListener = new GpsStatus.Listener() 
	{
		
		@Override
		public void onGpsStatusChanged(int event) 
		{
			switch (event) 
			{
				case GpsStatus.GPS_EVENT_STARTED:
				{
					Log.d(TAG, "GPS_EVENT_STARTED");
//					Toast.makeText(getApplicationContext(), "GPS_EVENT_STARTED", Toast.LENGTH_SHORT).show();
					
					break;
				}
				
				case GpsStatus.GPS_EVENT_STOPPED:
				{
					Log.d(TAG, "GPS_EVENT_STOPPED");
//					Toast.makeText(getApplicationContext(), "GPS_EVENT_STOPPED", Toast.LENGTH_SHORT).show();
					
					break;
				}
				
				case GpsStatus.GPS_EVENT_FIRST_FIX:
				{
					Log.d(TAG, "GPS_EVENT_FIRST_FIX");
//					Toast.makeText(getApplicationContext(), "GPS_EVENT_FIRST_FIX", Toast.LENGTH_SHORT).show();
					
					break;
				}
				
				case GpsStatus.GPS_EVENT_SATELLITE_STATUS:
				{
					Log.d(TAG, "GPS_EVENT_STOPPED");
//					Toast.makeText(getApplicationContext(), "GPS_EVENT_SATELLITE_STATUS", Toast.LENGTH_LONG).show();
					
					break;
				}
			
			}
				
		}
	
	};
    
    protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_google_map); 
        
    }   

	@Override
	protected void onStart() 
	{
	
		initView();
		initMap();
		
		super.onStart();
		
	}

	@Override
	protected void onResume() 
	{
		initMap();
		
		super.onResume();
	}

	@Override
	protected void onStop() 
	{
		myLocationMgr.removeUpdates(myLocationListener);
		
		super.onStop();
	}

	// initiate my map
	private void initMap() 
	{
		// TODO Auto-generated method stub
		if(myMap == null)
		{
			myMap = ((MapFragment) getFragmentManager().findFragmentById(R.id.map)).getMap();
//	        myMap.setMyLocationEnabled(true); 
		}
	}
	
	// initiate all views
	private void initView()
	{
		// Setup TextView
//		txtOutput = (TextView) findViewById(R.id.txtOutput);
		
		// Setup Button
		btn_MyHome = (Button) findViewById(R.id.btn_MyHome);
        btn_NAIT = (Button) findViewById(R.id.btn_NAIT);
        btn_drawLine = (Button) findViewById(R.id.btn_drawLine);
        btn_Iamhere = (Button) findViewById(R.id.btn_Iamhere);
        btn_NaitRestaurant = (Button) findViewById(R.id.btn_NaitRestaurant);
//        btn_MGL = (Button) findViewById(R.id.btn_MGL);
        // Setup Button Listener
        btn_MyHome.setOnClickListener(this);
        btn_NAIT.setOnClickListener(this);  
        btn_drawLine.setOnClickListener(this);
        btn_Iamhere.setOnClickListener(this);
        btn_NaitRestaurant.setOnClickListener(this);
//        btn_MGL.setOnClickListener(this);
        
	}
	
	// setup onClick content
	@Override
	public void onClick(View view) 
	{
		switch (view.getId()) 
		{
			case R.id.btn_MyHome:
			{
				
//				myMarker = myMap.addMarker(new MarkerOptions().position(myCurrentHouse).title("My House").snippet("11825 103 St NW Edmonton, AB T5G 2J3"));
				myMap.addMarker(new MarkerOptions().position(myCurrentHouse).title("My House").snippet("11825 103 St NW Edmonton, AB T5G 2J3"));
				update = CameraUpdateFactory.newLatLngZoom(myCurrentHouse, 16);
				myMap.animateCamera(update);
				//setup google map type
//				myMap.setMapType(GoogleMap.MAP_TYPE_TERRAIN);	
				
				break;
			}
			
			case R.id.btn_NAIT:
			{
//				myMarker = myMap.addMarker(new MarkerOptions().position(nait).title("NAIT").snippet("11762 106 St NW Edmonton, AB T5G 3H6"));
				myMap.addMarker(new MarkerOptions().position(nait).title("NAIT").snippet("11762 106 St NW Edmonton, AB T5G 3H6"));
				update = CameraUpdateFactory.newLatLngZoom(nait, 14);
				myMap.animateCamera(update);
				//setup google map type
				myMap.setMapType(GoogleMap.MAP_TYPE_NORMAL);
				
				break;
			}
			
			case R.id.btn_drawLine:
			{
				myPolyRoute();
				
				break;
			}
			
			case R.id.btn_Iamhere:
			{
				if (initLocationProvider()) 
				{
					
					whereAmI();
					//turn on google my current location
//					myMap.setMyLocationEnabled(false);
					
				}
				else
				{
					//toast to notify user to turn on gps
					Toast.makeText(getApplicationContext(), "Please turn on your GPS !", Toast.LENGTH_LONG).show();
				}
			}
			
			case R.id.btn_NaitRestaurant:
			{
				for (int i = 0; i < myNaitRestaurantPosition.length; i++) 
				{
					myMap.addMarker(new MarkerOptions().position(myNaitRestaurantPosition[i])
							.title(myNaitRestaurantTitle[i])
							.snippet(myNaitRestaurantAddr[i]));
//					update = CameraUpdateFactory.newLatLngZoom(myNaitRestaurantPosition[i], 14);
//					myMap.animateCamera(update);
//					myMap.setMapType(GoogleMap.MAP_TYPE_NORMAL);
				}
			}

		}
		
	}
	
	//Draw Polyline Demo
	private void myPolyRoute()
    {
		//setup your path line points in polyLineOption
    	PolylineOptions myPolyRoutOpt = new PolylineOptions();
    	
    	myPolyRoutOpt.add(myCurrentHouse);
    	myPolyRoutOpt.add(new LatLng(53.570355, -113.497398));
    	myPolyRoutOpt.add(new LatLng(53.570357, -113.496030));
    	myPolyRoutOpt.add(new LatLng(53.570107, -113.497315));
    	myPolyRoutOpt.add(new LatLng(53.569408, -113.499519));
    	myPolyRoutOpt.add(new LatLng(53.568355, -113.501461));
    	myPolyRoutOpt.add(new LatLng(53.567901, -113.502051));
    	myPolyRoutOpt.add(nait);
    	
    	myPolyRoutOpt.color(Color.BLUE);
    	
    	Polyline myRoutePolyLine = myMap.addPolyline(myPolyRoutOpt);
    	myRoutePolyLine.setWidth(10);
    }

	// initiate GPS by => locate my current place by GPS
	private boolean initLocationProvider() 
	{
		boolean myGPSOn = false;
		
		myLocationMgr = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
		
		if(myLocationMgr.isProviderEnabled(LocationManager.GPS_PROVIDER))
		{
			// Get GPS provider
			myProvider = LocationManager.GPS_PROVIDER;
			
			// return ture if GPS is turned on
			myGPSOn = true;
		}
		
		return myGPSOn;
	}
	
	// setup my current location
	private void whereAmI() 
	{
		// get my last location through gps
		Location myLastKnownLocation = myLocationMgr.getLastKnownLocation(myProvider);		
		updateMyCurrentLocation(myLastKnownLocation);
		
		// setup GSP listener
		myLocationMgr.addGpsStatusListener(myGDSListener);
		
		// setup location listener
		long minTime =5000; // ms
		float minDist = 5.0f; // meter
		myLocationMgr.requestLocationUpdates(myProvider, minTime, minDist, myLocationListener);
//		myMap.setMyLocationEnabled(true);
	}
	
	private void updateMyCurrentLocation(Location myLastKnownLocation) 
	{
		String imHere= "";
		
		if(myLastKnownLocation != null)
		{
			// get my last known location info
			double lat = myLastKnownLocation.getLatitude();
			double lng = myLastKnownLocation.getLongitude();
			float speed = myLastKnownLocation.getSpeed();
			long time = myLastKnownLocation.getTime();
			String myTime = getTimeformat(time);
			
			imHere = "Latitude: " + lat +
					 "\nLongitude: " + lng +
					 "\nSpeed: " + speed +
					 "\nTime: " + myTime +
					 "\nProvider: " + myProvider;
			
			showMyMarker(lat, lng);
			cameraFocusOnMe(lat, lng);
			trackMe(lat, lng);
					
		}
		else
		{
			imHere = "No Location Info Found !";
		}
		
		Toast.makeText(getApplicationContext(), "My Info: " + imHere, Toast.LENGTH_LONG).show();
		
	}
	
	//track my traveling and drawing poly lines
	private void trackMe(double lat, double lng) 
	{

		if(myTracks == null)
		{
			myTracks = new ArrayList<LatLng>();
		}
		
		myTracks.add(new LatLng(lat, lng));
		
		PolylineOptions myTrackPolyOpt = new PolylineOptions();
		
		for(LatLng myLatLng : myTracks)
		{
			myTrackPolyOpt.add(myLatLng);
		}
		
		myTrackPolyOpt.color(Color.rgb(16, 175, 64));
		
		Polyline myTrackPolyLine = myMap.addPolyline(myTrackPolyOpt);
		myTrackPolyLine.setWidth(10);
		
		
	}

	private void cameraFocusOnMe(double lat, double lng) 
	{
		myCameraPosition = new CameraPosition.Builder()
								.target(new LatLng(lat, lng))
								.zoom(14)
								.build();
		update = CameraUpdateFactory.newCameraPosition(myCameraPosition);
		myMap.animateCamera(update);
//		myMap.animateCamera(CameraUpdateFactory.newCameraPosition(myCameraPosition));
		
		
	}

	private void showMyMarker(double lat, double lng) 
	{
		if(myMarker != null)
		{
			myMarker.remove();
		}
		
		//add marker
		myMarkerOpt = new MarkerOptions();
		myMarkerOpt.position(new LatLng(lat, lng));
		myMarkerOpt.title("I am here");
//		myMarkerOpt.snippet("Latitude: " + lat + ", " + "Longitude: " + lng);
		myMarker = myMap.addMarker(myMarkerOpt);
		
//		Toast.makeText(getApplicationContext(), "Lat: " + lat + ", Lng: " + lng, Toast.LENGTH_LONG).show();
	}

	private String getTimeformat(long myTimeInMs)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return formatter.format(myTimeInMs);
	}

}
