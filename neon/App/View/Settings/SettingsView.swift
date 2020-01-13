//
//  SettingsView.swift
//  neon3
//
//  Created by James Saeed on 18/06/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @EnvironmentObject var settings: SettingsStore
    
    @State var isCalendarsPresented = false
    @State var isOtherStuffPresented = false
    @State var isPrivacyPolicyPresented = false
    
    var body: some View {
        List {
            Section(header: SettingsHeader()) {
                SettingsCard(title: "Permissions", subtitle: "Take control of", icon: "settings_permissions")
                    .onTapGesture {
                        self.openPermissionsSettings()
                    }
                SettingsCard(title: "Calendars", subtitle: "Take control of", icon: "settings_calendars")
                    .onTapGesture {
                        self.isCalendarsPresented.toggle()
                    }
                    .sheet(isPresented: $isCalendarsPresented, content: {
                        CalendarSettingsView(isPresented: self.$isCalendarsPresented)
                            .environmentObject(self.scheduleViewModel)
                            .environmentObject(self.settings)
                    })
                SettingsCard(title: "Other Stuff", subtitle: "Take control of", icon: "settings_other")
                    .onTapGesture {
                        self.isOtherStuffPresented.toggle()
                    }
                    .sheet(isPresented: $isOtherStuffPresented, content: {
                        OtherSettingsView(isPresented: self.$isOtherStuffPresented, timeFormatValue: self.settings.other[OtherSettingsKey.timeFormat.rawValue]!, reminderTimerValue: self.settings.other[OtherSettingsKey.reminderTimer.rawValue]!, autoCapsValue: self.settings.other[OtherSettingsKey.autoCaps.rawValue]!)
                            .environmentObject(self.scheduleViewModel)
                            .environmentObject(self.settings)
                    })
                SettingsCard(title: "Twitter", subtitle: "Follow me on", icon: "settings_twitter")
                    .onTapGesture {
                        self.openTwitter()
                    }
                SettingsCard(title: "Privacy Policy", subtitle: "Take a look at the", icon: "settings_privacy")
                    .onTapGesture {
                        self.isPrivacyPolicyPresented.toggle()
                    }
                    .sheet(isPresented: $isPrivacyPolicyPresented, content: {
                        PrivacyPolicyView(isPresented: self.$isPrivacyPolicyPresented)
                    })
            }
        }
    }
    
    func openPermissionsSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func openTwitter() {
        if let url = URL(string: "https://twitter.com/j_t_saeed") {
            UIApplication.shared.open(url)
        }
    }
}

private struct SettingsHeader: View {
    
    var body: some View {
        Header(title: "Settings", subtitle: "TAKE CONTROL") {
            EmptyView()
        }
    }
}

struct SettingsCard: View {
    
    let title: String
    let subtitle: String
    let icon: String
    
    var body: some View {
        Card {
            HStack {
                CardLabels(title: self.title,
                           subtitle: self.subtitle.uppercased())
                Spacer()
                Image(self.icon)
            }
        }
    }
}

struct SettingsView_Previews : PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}