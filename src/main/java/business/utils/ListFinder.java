package business.utils;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertTrue;

public class ListFinder {

    public int findSecondGreater(List<Integer> data, Integer greaterValue){
        int greater=Integer.MIN_VALUE;
        for( Integer value : data){
            if (value > greater && value < greaterValue){
                greater = value;
            }

        }
        return greater;
    }

    public static void main(String[] args) {
            List<Integer> data = new ArrayList<>();
            data.add(1);
            data.add(10);
            data.add(20);
            data.add(30);
            data.add(40);
            data.add(50);
            data.add(50);
            ListFinder finder = new ListFinder();

        int greater = finder.findSecondGreater(data,Integer.MAX_VALUE);
        data.remove(greater);
        System.out.println("greater Value:" + Integer.MAX_VALUE);

        int secondGreater = finder.findSecondGreater(data,greater);
        System.out.println("SecondGreater Value:" + secondGreater );

    }
}


