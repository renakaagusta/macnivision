import SwiftUI

struct DayItemCard: View {
    @State var isDiaryExist: Bool
    @State var dateNumber: Int

    var body: some View {
        ZStack{
            if isDiaryExist{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 47, height: 70)
                    .foregroundColor(greenbutton)
            
                Text("\(dateNumber)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            } else{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: -0.324, green: 0.671, blue: 0.535), lineWidth: 4)
                    .frame(width: 47, height: 70)
                    .foregroundColor(softgreenbackground)
            
                Text("\(dateNumber)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(greenbutton)
            }
            
        }
    }
}

struct DayItemCard_Previews: PreviewProvider {
    static var previews: some View {
        DayItemCard(isDiaryExist: true, dateNumber: 31)
    }
}
