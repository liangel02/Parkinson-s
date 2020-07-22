//
//  ContentView.swift
//  parkinsons
//
//  Created by angel li on 2020-07-16.
//

import SwiftUI
import UIKit

struct ContentView: View
{
    @State var avgVocalFund = ""
    @State var maxVocalFund = ""
    @State var minVocalFund = ""
    @State var jitter = ""
    @State var absJitter = ""
    @State var rap = ""
    @State var ppq = ""
    @State var ddp = ""
    @State var localShimmer = ""
    @State var localShimmerDB = ""
    @State var apq3 = ""
    @State var apq5 = ""
    @State var apq = ""
    @State var dda = ""
    @State var nhr = ""
    @State var hnr = ""
    @State var rpde = ""
    @State var dfa = ""
    @State var spread1 = ""
    @State var spread2 = ""
    @State var d2 = ""
    @State var ppe = ""
    var textFieldArray = [String]()

    var body: some View
    {
        ScrollView(.vertical)
        {
            VStack(spacing: 10)
            {
                Group
                {
                    //input data
                    TextField("Avg vocal fundamental frequency", text: $avgVocalFund)
                    TextField("Max vocal fundamental frequency", text: $maxVocalFund)
                    TextField("Min vocal fundamental frequency", text: $minVocalFund)
                    TextField("MDVP jitter in percentage", text: $jitter)
                    TextField("MDVP absolute jitter in ms", text: $absJitter)
                    TextField("MDVP relative amp perturbation", text: $rap)
                    TextField("MDVP five-point period perturbation quotient", text: $ppq)
                    TextField("Avg diff of diffs between jitter cycles", text: $ddp)
                    TextField("MDVP local shimmer", text: $localShimmer)
                    TextField("MDVP local shimmer in dB", text: $localShimmerDB)
                }
                Group
                {
                    TextField("Three-point amp perturbation quotient", text: $apq3)
                    TextField("Five-point amp perturbation quotient", text: $apq5)
                    TextField("Amp perturbation quotient", text: $apq)
                    TextField("Avg diffs between amp of consecutive periods", text: $dda)
                    TextField("Noise-to-harmonics ratio", text: $nhr)
                    TextField("Harmonics-to-noise ratio", text:$hnr)
                    TextField("Recurrence period density entropy measure", text: $rpde)
                    TextField("Signal fractal scaling exponent of detrended fluctuation analysis", text: $dfa)
                    TextField("Two nonlinear measures of fundamental", text: $spread1)
                    TextField("Frequency variation", text: $spread2)
                }
                Group
                {
                    TextField("Correlation dimension", text: $d2)
                    TextField("Pitch period entropy", text: $ppe)
                    //button
                }

                
                Button(action:
                {
                    
                })
                {
                    Text("Submit")
                }
            }
            .padding(.bottom, 20)
            .padding(.top, 20)
            .padding(.horizontal, 30)
        }
        .frame(maxWidth: .infinity)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group {
            ContentView()
            ContentView()
        }
    }
}
#endif
