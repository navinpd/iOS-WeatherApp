//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Navin prasad on 07/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityName(cityName: "Capurtino, CA")
                
                MainWeatherStatusView(temperature: 72, image: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                Spacer()
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "Mon", imageName: "sun.dust.fill", temp: 22)
                    
                    WeatherDayView(dayOfWeek: "Tue", imageName: "sun.max.fill", temp: 12)
                    
                    WeatherDayView(dayOfWeek: "Wed", imageName: "snow", temp: 23)
                    
                    WeatherDayView(dayOfWeek: "Thu", imageName: "sun.haze.fill", temp: 15)
                    
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.sun.rain.fill", temp: 11)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: Color.white
                    )
                }
                Spacer()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var imageName : String
    var temp : Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .foregroundColor(.white)
                .font(.system(size: 28))
        }
    }
}

struct BackgroundView: View {
//    var topColor: Color
//    var bottomColor : Color
    @Binding var isNight : Bool
    var body: some View {
        
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("lightBlue"),
                                                isNight ? .gray : .blue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var temperature : Int
    var image: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

