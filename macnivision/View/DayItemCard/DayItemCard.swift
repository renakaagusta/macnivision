import SwiftUI

struct DayItemCard: View {
    @State var isDiaryExist: Bool
    @State var dateNumber: Int
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ZStack{
            if isDiaryExist{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 48, height: 72)
                    .foregroundColor(greenbutton)
            
                Text("\(dateNumber)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            } else{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(greenstroke, lineWidth: 4)
                    .frame(width: 47, height: 70)
                    .foregroundColor(softgreenbackground)
                
            
                Text("\(dateNumber)")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 47, height: 70)
                    .foregroundColor(greenbutton)
                    .background(softgreenbackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        showAlert(title: "You didn't have any journal entry on this day :'(")
                    }
            }
        }
        .alert(isPresented: $showAlert, content: {
                return Alert(title: Text(alertTitle))
        })
    }
    
    func showAlert(title: String){
        alertTitle =  title
        showAlert.toggle()
    }
    
}

struct DayItemCard_Previews: PreviewProvider {
    static var previews: some View {
        DayItemCard(isDiaryExist: true, dateNumber: 31)
    }
}
